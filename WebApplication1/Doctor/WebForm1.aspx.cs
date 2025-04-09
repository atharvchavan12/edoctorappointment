using OpenCvSharp;
using System;
using System.Web;
using System.Web.Services;

namespace WebApplication1.Doctor
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        [WebMethod]
        public static object CompareImage(string image)
        {
            try
            {
                // Decode base64 image
                byte[] imageBytes = Convert.FromBase64String(image.Split(',')[1]);
                string tempPath = HttpContext.Current.Server.MapPath("~/Output/self.jpg");
                System.IO.File.WriteAllBytes(tempPath, imageBytes);

                // Process and compare the image
                var result = new FaceRecognition().CompareWithDatabase(tempPath);
                return new { match = result };
            }
            catch (Exception ex)
            {
                return new { match = false, error = ex.Message };
            }
        }
    }

    public class FaceRecognition
    {
        public bool CompareWithDatabase(string capturedImagePath)
        {
            string haarCascadePath = HttpContext.Current.Server.MapPath("~/App_Data/haarcascade_frontalface_default.xml");
            var faceCascade = new CascadeClassifier(haarCascadePath);

            Mat capturedImage = Cv2.ImRead(capturedImagePath);
            if (capturedImage.Empty())
                throw new Exception("Captured image is empty.");

            Rect[] capturedFaces = faceCascade.DetectMultiScale(capturedImage, scaleFactor: 1.1, minNeighbors: 5);
            if (capturedFaces.Length == 0)
                throw new Exception("No face detected in the captured image.");

            string storedImagePath = HttpContext.Current.Server.MapPath("~/DatabaseImages/self.jpg");
            Mat storedImage = Cv2.ImRead(storedImagePath);
            if (storedImage.Empty())
                throw new Exception("Stored image is empty.");

            Rect[] storedFaces = faceCascade.DetectMultiScale(storedImage, scaleFactor: 1.1, minNeighbors: 5);
            if (storedFaces.Length == 0)
                throw new Exception("No face detected in the stored image.");

            Mat capturedFace = new Mat(capturedImage, capturedFaces[0]);
            Mat storedFace = new Mat(storedImage, storedFaces[0]);

            return CompareFaces(capturedFace, storedFace);
        }

        private bool CompareFaces(Mat face1, Mat face2)
        {
            // Resize both images to a standard size
            Cv2.Resize(face1, face1, new OpenCvSharp.Size(100, 100));
            Cv2.Resize(face2, face2, new OpenCvSharp.Size(100, 100));

            // Calculate histogram and compare
            Mat hist1 = new Mat();
            Mat hist2 = new Mat();

            Cv2.CalcHist(new Mat[] { face1 }, new int[] { 0 }, null, hist1, 1, new int[] { 256 }, new Rangef[] { new Rangef(0, 256) });
            Cv2.CalcHist(new Mat[] { face2 }, new int[] { 0 }, null, hist2, 1, new int[] { 256 }, new Rangef[] { new Rangef(0, 256) });

            Cv2.Normalize(hist1, hist1, 0, 1, NormTypes.MinMax);
            Cv2.Normalize(hist2, hist2, 0, 1, NormTypes.MinMax);

            double similarity = Cv2.CompareHist(hist1, hist2, HistCompMethods.Correl);
            return similarity > 0.8; // Threshold for similarity
        }
    }
}
