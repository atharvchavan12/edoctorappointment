<%@ Page Title="" Language="C#" MasterPageFile="~/navfooter.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.Doctor.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <script>
       // Automatically start the camera on page load
       window.onload = function () {
           const video = document.querySelector("#videoElement");
           navigator.mediaDevices.getUserMedia({ video: true })
               .then(stream => {
                   video.srcObject = stream;
               })
               .catch(err => {
                   console.error("Error accessing the camera: ", err);
                   alert("Unable to access the camera.");
               });
       };

       // Capture the image and send it to the server
       function captureImage() {
           const video = document.querySelector("#videoElement");
           const canvas = document.createElement("canvas");
           canvas.width = video.videoWidth;
           canvas.height = video.videoHeight;
           const ctx = canvas.getContext("2d");
           ctx.drawImage(video, 0, 0, canvas.width, canvas.height);

           const imageData = canvas.toDataURL("image/jpeg");
           // Send image data to the server
           fetch("WebForm1.aspx/CompareImage", {
               method: "POST",
               body: JSON.stringify({ image: imageData }),
               headers: { "Content-Type": "application/json" }
           })
               .then(response => response.json())
               .then(result => {
                   if (result.d.match) { // Adjusted for ASP.NET JSON response
                       window.location.href = "aboutus.aspx";
                   } else {
                       alert("Face not recognized.");
                   }
               })
               .catch(err => {
                   console.error("Error processing image: ", err);
                   alert("An error occurred. Please try again.");
               });
       }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <h1>Face Recognition</h1>
    <video id="videoElement" autoplay style="width: 640px; height: 480px; border: 1px solid black;"></video>
    <br />
    <button onclick="captureImage()">Capture and Compare</button>
</asp:Content>
