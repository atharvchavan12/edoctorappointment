<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.Patient.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CSS Cards with Overlay Hover Animation</title>
   
	
	
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap" rel="stylesheet">
<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <style>

.card-area {
        font-family: 'Poppins', sans-serif;
box-sizing: border-box;
background: azure;
color: #fff;
}
.wrapper {
    padding: 10px 10%;
   
}

#card-area {
    padding: 50px 0;
}


    .box-area {
    display: grid;
    grid-template-columns: repeat(3, 1fr); /* Ensures only 3 items per row */
    grid-gap: 40px;
    margin-top: 50px;


}

.box {
    border-radius: 10px;
    position: relative;
    height: 450px; /* Increased height to give more space */
    overflow: hidden;
    box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.9);
}

.box img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    border-radius: 10px;
    display: block;
    transition: transform 0.5s ease; /* Smooth scaling effect */
}

.overlay {
    width: 100%;
    height: 100%;
    background: linear-gradient(transparent, #1c1c1c 58%);
    border-radius: 10px;
    position: absolute;
    left: 0;
    top: 0;
    display: flex;
    align-items: center;
    flex-direction: column;
    padding: 150px 20px 20px; /* Increased padding at the top to move content down */
    text-align: center;
    font-size: 14px;
    transition: height 0.5s ease;
    margin-bottom: -200px;
}

.box:hover .overlay {
    opacity: 1;
    height: 100%;
}

.overlay h3 {
    font-weight: 500;
    margin-top: 15%; /* Adjusted top margin to push text downward */
    margin-bottom: 5px; /* Reduced bottom margin to bring it closer to p */
    font-family: 'Bebas Neue', sans-serif;
    font-size: 30px;
    letter-spacing: 2px;
}

.overlay p {
    margin-top: 5%; /* Reduced margin-top to bring p closer to h3 */
    margin-bottom: 10px;
}

.box:hover {
    transform: translateY(-10px);
    box-shadow: 10px 10px 25px rgba(0, 0, 0, 0.8);
}

.box:hover img {
    transform: scale(1.1);
}

.overlay .buttons {
    margin-top: 20px; /* Added margin-top to create space between text and buttons */
    display: flex;
    gap: 10px;
    justify-content: center;
    align-items: center;
    opacity: 1;
    visibility: visible;
    transition: opacity 0.3s ease, visibility 0.3s ease;
}

.overlay .buttons button {
    padding: 8px 15px;
    font-size: 14px;
    border: none;
    border-radius: 5px;
    background-color: #007bff;
    color: #fff;
    cursor: pointer;
    transition: background-color 0.3s ease, transform 0.3s ease;
}

.overlay .buttons button:hover {
    background-color: #0056b3;
    transform: scale(1.05);
}

.box:hover .buttons {
    opacity: 0;
    visibility: hidden;
}

</style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="card-area">
            <div class="wrapper">
              <div class="box-area">
    <div class="box">
        <img src="<%= ResolveUrl("~/img/1availablefeature.jpg") %>" alt="Feature 1" />
             <div class="overlay">
    <h3>Mountaineering</h3>
    <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Neque modi explicabo libero ea nam. QuodLorem ipsum dolor sit, amet consectetur adipisicing elit. Neque modi explicabo libero ea nam. Quod.</p>
<div class="buttons">
<div class="d-grid gap-2 d-md-flex justify-content-center">
    <div class="d-grid gap-2">
  <button class="btn btn-primary btn-sm" style="width: 300px;">Cost- Rs.500/-</button>
</div>
</div>
   
</div>  
</div>
    </div>


    <div class="box">
        <img src="<%= ResolveUrl("~/img/4availablefeature.jpg") %>" alt="Feature 2" />
      <div class="overlay">
    <h3>Mountaineering</h3>
    <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Neque modi explicabo libero ea nam. QuodLorem ipsum dolor sit, amet consectetur adipisicing elit. Neque modi explicabo libero ea nam. Quod.</p>

   
<div class="buttons">
<div class="d-grid gap-2 d-md-flex justify-content-center">
    <div class="d-grid gap-2">
  <button class="btn btn-primary btn-sm" style="width: 300px;">Cost- Rs.500/-</button>
</div>
</div>
   
</div>


  
</div>

    </div>

      <div class="box">
        <img src="<%= ResolveUrl("~/img/4availablefeature.jpg") %>" alt="Feature 2" />
      <div class="overlay">
    <h3>Mountaineering</h3>
    <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Neque modi explicabo libero ea nam. QuodLorem ipsum dolor sit, amet consectetur adipisicing elit. Neque modi explicabo libero ea nam. Quod.</p>

   
<div class="buttons">
<div class="d-grid gap-2 d-md-flex justify-content-center">
    <div class="d-grid gap-2">
  <button class="btn btn-primary btn-sm" style="width: 300px;">Cost- Rs.500/-</button>
</div>
</div>
   
</div>


  
</div>

    </div>

                      <div class="box">
        <img src="<%= ResolveUrl("~/img/4availablefeature.jpg") %>" alt="Feature 2" />
      <div class="overlay">
    <h3>Mountaineering</h3>
    <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Neque modi explicabo libero ea nam. QuodLorem ipsum dolor sit, amet consectetur adipisicing elit. Neque modi explicabo libero ea nam. Quod.</p>

   
<div class="buttons">
<div class="d-grid gap-2 d-md-flex justify-content-center">
    <div class="d-grid gap-2">
  <button class="btn btn-primary btn-sm" style="width: 300px;">Cost- Rs.500/-</button>
</div>
</div>
   
</div>


  
</div>

    </div>

                                        <div class="box">
        <img src="<%= ResolveUrl("~/img/4availablefeature.jpg") %>" alt="Feature 2" />
      <div class="overlay">
    <h3>Mountaineering</h3>
    <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Neque modi explicabo libero ea nam. QuodLorem ipsum dolor sit, amet consectetur adipisicing elit. Neque modi explicabo libero ea nam. Quod.</p>

   
<div class="buttons">
<div class="d-grid gap-2 d-md-flex justify-content-center">
    <div class="d-grid gap-2">
  <button class="btn btn-primary btn-sm" style="width: 300px;">Cost- Rs.500/-</button>
</div>
</div>
   
</div>


  
</div>

    </div>

                                        <div class="box">
        <img src="<%= ResolveUrl("~/img/4availablefeature.jpg") %>" alt="Feature 2" />
      <div class="overlay">
    <h3>Mountaineering</h3>
    <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Neque modi explicabo libero ea nam. QuodLorem ipsum dolor sit, amet consectetur adipisicing elit. Neque modi explicabo libero ea nam. Quod.</p>

   
<div class="buttons">
<div class="d-grid gap-2 d-md-flex justify-content-center">
    <div class="d-grid gap-2">
  <button class="btn btn-primary btn-sm" style="width: 300px;">Cost- Rs.500/-</button>
</div>
</div>
   
</div>


  
</div>

    </div>

                                        <div class="box">
        <img src="<%= ResolveUrl("~/img/4availablefeature.jpg") %>" alt="Feature 2" />
      <div class="overlay">
    <h3>Mountaineering</h3>
    <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Neque modi explicabo libero ea nam. QuodLorem ipsum dolor sit, amet consectetur adipisicing elit. Neque modi explicabo libero ea nam. Quod.</p>

   
<div class="buttons">
<div class="d-grid gap-2 d-md-flex justify-content-center">
    <div class="d-grid gap-2">
  <button class="btn btn-primary btn-sm" style="width: 300px;">Cost- Rs.500/-</button>
</div>
</div>
   
</div>


  
</div>

    </div>

                                        <div class="box">
        <img src="<%= ResolveUrl("~/img/4availablefeature.jpg") %>" alt="Feature 2" />
      <div class="overlay">
    <h3>Mountaineering</h3>
    <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Neque modi explicabo libero ea nam. QuodLorem ipsum dolor sit, amet consectetur adipisicing elit. Neque modi explicabo libero ea nam. Quod.</p>

   
<div class="buttons">
<div class="d-grid gap-2 d-md-flex justify-content-center">
    <div class="d-grid gap-2">
  <button class="btn btn-primary btn-sm" style="width: 300px;">Cost- Rs.500/-</button>
</div>
</div>
   
</div>


  
</div>

    </div>

                                        <div class="box">
        <img src="<%= ResolveUrl("~/img/4availablefeature.jpg") %>" alt="Feature 2" />
      <div class="overlay">
    <h3>Mountaineering</h3>
    <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Neque modi explicabo libero ea nam. QuodLorem ipsum dolor sit, amet consectetur adipisicing elit. Neque modi explicabo libero ea nam. Quod.</p>

   
<div class="buttons">
<div class="d-grid gap-2 d-md-flex justify-content-center">
    <div class="d-grid gap-2">
  <button class="btn btn-primary btn-sm" style="width: 300px;">Cost- Rs.500/-</button>
</div>
</div>
   
</div>


  
</div>

    </div>

                                        <div class="box">
        <img src="<%= ResolveUrl("~/img/4availablefeature.jpg") %>" alt="Feature 2" />
      <div class="overlay">
    <h3>Mountaineering</h3>
    <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Neque modi explicabo libero ea nam. QuodLorem ipsum dolor sit, amet consectetur adipisicing elit. Neque modi explicabo libero ea nam. Quod.</p>

   
<div class="buttons">
<div class="d-grid gap-2 d-md-flex justify-content-center">
    <div class="d-grid gap-2">
  <button class="btn btn-primary btn-sm" style="width: 300px;">Cost- Rs.500/-</button>
</div>
</div>
   
</div>


  
</div>

    </div>

                                        <div class="box">
        <img src="<%= ResolveUrl("~/img/4availablefeature.jpg") %>" alt="Feature 2" />
      <div class="overlay">
    <h3>Mountaineering</h3>
    <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Neque modi explicabo libero ea nam. QuodLorem ipsum dolor sit, amet consectetur adipisicing elit. Neque modi explicabo libero ea nam. Quod.</p>

   
<div class="buttons">
<div class="d-grid gap-2 d-md-flex justify-content-center">
    <div class="d-grid gap-2">
  <button class="btn btn-primary btn-sm" style="width: 300px;">Cost- Rs.500/-</button>
</div>
</div>
   
</div>


  
</div>

    </div>
                                   
                  <div class="box">
        <img src="<%= ResolveUrl("~/img/4availablefeature.jpg") %>" alt="Feature 2" />
      <div class="overlay">
    <h3>Mountaineering</h3>
    <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Neque modi explicabo libero ea nam. QuodLorem ipsum dolor sit, amet consectetur adipisicing elit. Neque modi explicabo libero ea nam. Quod.</p>

   
<div class="buttons">
<div class="d-grid gap-2 d-md-flex justify-content-center">
    <div class="d-grid gap-2">
  <button class="btn btn-primary btn-sm" style="width: 300px;">Cost- Rs.500/-</button>
</div>
</div>
   
</div>


  
</div>

    </div>
</div>

            </div>
        </div>
    </form>
</body>
</html>
