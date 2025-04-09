<%@ Page Title="" Language="C#" MasterPageFile="~/navfooter.Master" AutoEventWireup="true" CodeBehind="consultancy.aspx.cs" Inherits="WebApplication1.Doctor.consultancy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
      
    .custom-button {
        background-color: #007bff;
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        font-size: 16px;
        transition: background-color 0.3s ease;
    }

    .custom-button:hover {
        background-color: #0056b3;
    }

        /* General Styles */
       .container-fluid {
    font-family: 'Poppins';
    margin-top: 30px;
    max-width: 95%; /* Adjusts the width to 95% of the viewport */
    margin-left: auto; /* Centers the container */
    margin-right: auto; /* Centers the container */
    background-color:azure;
}


        /* Right Column: Content Wrapper */
      .contentWrapper {
    padding: 20px;
    background-color: #f9f9f9;
    border-radius: 10px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}
      .consultation-title {
    font-size: 1.8rem;
    color: #007bff;
    font-weight: bold;
    text-align: center;
    margin-bottom: 15px;
    text-transform: uppercase;
}
      .intro-text {
    font-size: 1.2rem;
    line-height: 1.6;
    color: #333;
    margin-bottom: 15px;
    text-align: justify;
}

.why-choose,
.services-heading {
    font-size: 1.3rem;
    font-weight: bold;
    color: #007bff;
    margin: 15px 0 10px;
}

.benefits-list,
.services-list {
    list-style-type: disc;
    padding-left: 20px;
    margin: 0 0 15px;
}

.benefits-list li,
.services-list li {
    font-size: 1rem;
    line-height: 1.5;
    color: #555;
    margin: 5px 0;
}

.cta-link {
    display: inline-block;
    margin-top: 20px;
    padding: 10px 20px;
    background-color: #007bff;
    color: white;
    text-decoration: none;
    border-radius: 5px;
    transition: background-color 0.3s ease, transform 0.3s ease;
    text-align: center;
}

.cta-link:hover {
    background-color: #0056b3;
    transform: scale(1.05);
}

/* Remove unwanted spaces */
p, ul, li {
    margin: 0;
    padding: 0;
}
        /* Text Wrapper */
        .textWrapper {
            display: flex;
            align-items: center;
            gap: 15px;
            margin-bottom: 20px;
        }

        .textWrapper span {
            display: inline-block;
            background: #383f47;
            width: 70px;
            height: 5px;
        }

        /* Heading */
        .contentWrapper h2 {
            font-size: 40px;
            font-weight: 700;
            color: #383f47;
            margin-bottom: 20px;
        }

        /* Paragraph */
        .contentWrapper p {
            font-size: 16px;
            line-height: 25px;
            margin-bottom: 25px;
        }

        /* Button */
        .contentWrapper a {
            display: inline-block;
            text-decoration: none;
            text-transform: uppercase;
            background: #383f47;
            color: #fff;
            padding: 15px 40px;
            letter-spacing: 1px;
            transition: 0.3s ease;
        }

        .contentWrapper a:hover {
            background: #50575e;
        }


        
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

    <div class="container-fluid">
        <div class="row">
            <!-- Left Column: Form for User -->
            <div class="col-md-6">
                <div class="card p-4">
                    <div class="row">
                        <div class="col text-center">
                            <img width="150px" src="../img/onlinecosultancy.jpg" alt="Appointment Logo" />
                        </div>
                    </div>

                    <div class="row mt-3">
                        <div class="col text-center">
                            <h4>Online Consultancy Form</h4>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <hr />
                        </div>
                    </div>

                    <form>
                        <!-- Patient Full Name and Date of Birth -->
                        <div class="row">
                            <div class="col-md-6">
                                <label for="username" class="form-label">Patient Full Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Full Name"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label for="password" class="form-label">Date Of Birth</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Birth date" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <!-- Email ID and Gender -->
                        <div class="row mt-3">
                            <div class="col-md-6">
                                <label for="username" class="form-label">Email ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Email"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label for="gender" class="form-label">Gender</label>
                                <div class="form-group">
                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" CssClass="radio-list">
                                        <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                                        <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                                        <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                        </div>

                       

                        <!-- Select Consultant Package -->
                        <div class="row mt-3">

                             <div class="col-md-6">
     <label for="password" class="form-label">Contact</label>
     <div class="form-group">
         <asp:TextBox CssClass="form-control" ID="TextBox12" runat="server" placeholder="Contact" ></asp:TextBox>
     </div>
 </div>
                            <div class="col-md-6">
                                <label for="consultant" class="form-label">Select Consultant Package</label>
                                <div class="form-group">
                                    <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server">
                                        <asp:ListItem Text="Select" Value="select"></asp:ListItem>
                                        <asp:ListItem Text="Radien Glow Package" Value="RadienGlowPackage"></asp:ListItem>
                                        <asp:ListItem Text="Acne Free Skin Package" Value="AcneFreeSkinPackage"></asp:ListItem>
                                         <asp:ListItem Text="Even Tone Package" Value="EvenTonePackage"></asp:ListItem>
                                         <asp:ListItem Text="Hair Free Smooth Package" Value="HairFreeSmoothPackage"></asp:ListItem>
                                         <asp:ListItem Text="Scar Revision Package" Value="ScarRevisionPackage"></asp:ListItem>
                                         <asp:ListItem Text="Spotless Skin Package" Value="SpotlessSkinPackage"></asp:ListItem>
                                         <asp:ListItem Text="Dermotology Care" Value="DermotologyCare"></asp:ListItem>
                                         <asp:ListItem Text="Skin Care & Disease" Value="SkinCare&Disease"></asp:ListItem>
                                          <asp:ListItem Text="Dermotology Insight" Value="DermotologyInsight"></asp:ListItem>
                                         <asp:ListItem Text="Flawless Laser Package" Value="FlawlessLaserPackage"></asp:ListItem>
                                          <asp:ListItem Text="DeepClean Laser Package" Value="DeepCleanLaserPackage"></asp:ListItem>
                                            <asp:ListItem Text="YouthFul Laser Package" Value="YouthFulLaserPackage"></asp:ListItem>
                                            <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
    </asp:DropDownList>
                                </div>
                            </div>
                        </div>

                         <!-- Problem Description -->
 <div class="row mt-3">
     <div class="col">
         <label for="password" class="form-label">Problem Description</label>
         <div class="form-group">
             <asp:TextBox CssClass="form-control" ID="TextBox11" runat="server" TextMode="MultiLine"></asp:TextBox>
         </div>
     </div>
 </div>

                        <!-- Submit Button -->
                        <div class="row mt-4">
                            <div class="col text-center">
                           <asp:Button CssClass="btn-block btn-lg custom-button" ID="Button1" runat="server" Text="Request Consultancy Appointment" OnClick="Button1_Click" />
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Bootstrap Modal -->
<div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-labelledby="modalTitle" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalTitle">Notification</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <asp:Label ID="lblModalMessage" runat="server" Text=""></asp:Label>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
            </div>
        </div>
    </div>
</div>


            <!-- Right Column: Information About Consultancy -->
         <div class="col-md-6">
    <div class="contentWrapper">
        <div class="textWrapper"></div>
        <h2 class="consultation-title">OUR CONSULTATION</h2>
        <p class="intro-text">
            At Zopes's Clinic, that is in our Skin and Laser Clinic, we understand that everyone's skin is unique and deserves personalized attention. With our online consultation services, you can now connect with our experienced dermatologists and laser specialists from the comfort of your home.
        </p>
        <p class="why-choose">Why Choose Our Online Consultation?</p>
        <ul class="benefits-list">
            <li>Professional Guidance: Get expert advice from certified skin specialists for all your skin concerns.</li>
            <li>Convenience: No more waiting rooms—schedule an appointment at your convenience.</li>
            <li>Comprehensive Solutions: From acne and pigmentation to advanced laser treatments, we cover all your dermatological needs.</li>
        </ul>
        <p class="services-heading">Our Specialized Services Include:</p>
        <ul class="services-list">
            <li>Advanced Laser Hair Removal</li>
            <li>Acne and Scar Treatments</li>
            <li>Pigmentation and Skin Brightening Solutions</li>
            <li>Anti-Aging Procedures</li>
            <li>Skin Rejuvenation and Hydration Therapy</li>
        </ul>
        <a href="#" class="cta-link">Read More..</a>
    </div>
</div>
        </div>
    </div>


        <div class="card-area">
            <div class="wrapper">
              <div class="box-area">
    <div class="box">
        <img src="<%= ResolveUrl("~/img/con1.jpg") %>" alt="Feature 1" />
             <div class="overlay">
    <h3>Radient Glow Package</h3>
    <p>The Radiant Glow Package is your ultimate solution for achieving naturally luminous and flawless skin.This comprehensive treatment focuses on revitalizing dull,tired-looking skin,and enhancing your natural radiance.</p>
<div class="buttons">
<div class="d-grid gap-2 d-md-flex justify-content-center">
    <div class="d-grid gap-2">
  <button class="btn btn-primary btn-sm" style="width: 300px;">Cost- Rs.100/-</button>
</div>
</div>
   
</div>  
</div>
    </div>


    <div class="box">
        <img src="<%= ResolveUrl("~/img/con2.jpg") %>" alt="Feature 2" />
      <div class="overlay">
    <h3>Acne Free Skin Package</h3>
    <p>The Acne-Free Skin Package offers advanced treatments to combat acne, reduce scars, and prevent breakouts. Achieve clearer, smoother, and healthier skin with our personalized care and expert guidance.</p>

   
<div class="buttons">
<div class="d-grid gap-2 d-md-flex justify-content-center">
    <div class="d-grid gap-2">
  <button class="btn btn-primary btn-sm" style="width: 300px;">Cost- Rs.1000/-</button>
</div>
</div>
   
</div>


  
</div>

    </div>

      <div class="box">
        <img src="<%= ResolveUrl("~/img/con3.jpg") %>" alt="Feature 2" />
      <div class="overlay">
    <h3>Even Tone Package</h3>
    <p>The Even Tone Package is designed to target pigmentation, dark spots, and uneven skin tone. Achieve radiant, balanced, and glowing skin with customized treatments tailored to your specific needs.</p>

   
<div class="buttons">
<div class="d-grid gap-2 d-md-flex justify-content-center">
    <div class="d-grid gap-2">
  <button class="btn btn-primary btn-sm" style="width: 300px;">Cost- Rs.750/-</button>
</div>
</div>
   
</div>


  
</div>

    </div>

                      <div class="box">
        <img src="<%= ResolveUrl("~/img/con4.jpg") %>" alt="Feature 2" />
      <div class="overlay">
    <h3>Hair Free Smooth Package</h3>
    <p>The Hair-Free Smooth Package offers advanced laser hair removal for silky, smooth skin. Say goodbye to unwanted hair with painless, effective sessions designed for long-lasting results and ultimate confidence.</p>

   
<div class="buttons">
<div class="d-grid gap-2 d-md-flex justify-content-center">
    <div class="d-grid gap-2">
  <button class="btn btn-primary btn-sm" style="width: 300px;">Cost- Rs.600/-</button>
</div>
</div>
</div>  
</div>
    </div>

        <div class="box">
        <img src="<%= ResolveUrl("~/img/con5.png") %>" alt="Feature 2" />
      <div class="overlay">
    <h3>Scar Revision Package</h3>
    <p>The Scar Revision Package focuses on minimizing the appearance of scars using advanced treatments. Restore your skin's texture and confidence with personalized care tailored for smooth, even-toned skin.</p>

   
<div class="buttons">
<div class="d-grid gap-2 d-md-flex justify-content-center">
    <div class="d-grid gap-2">
  <button class="btn btn-primary btn-sm" style="width: 300px;">Cost- Rs.350/-</button>
</div>
</div>
</div>
</div>
    </div>

                                        <div class="box">
        <img src="<%= ResolveUrl("~/img/con6.jpg") %>" alt="Feature 2" />
      <div class="overlay">
    <h3>Spotless Skin Package</h3>
    <p>The Spotless Skin Package is designed to target pigmentation, dark spots, and uneven tone. Achieve radiant, flawless skin with our advanced treatments for a brighter, rejuvenated complexion.</p>

   
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
        <img src="<%= ResolveUrl("~/img/con7.jpg") %>" alt="Feature 2" />
      <div class="overlay">
    <h3>Dermatology Care </h3>
    <p> This Package provides comprehensive solutions for various skin conditions, offering expert consultations, personalized treatment plans, and advanced therapies to ensure healthy, radiant, and clear skin for all.</p>

   
<div class="buttons">
<div class="d-grid gap-2 d-md-flex justify-content-center">
    <div class="d-grid gap-2">
  <button class="btn btn-primary btn-sm" style="width: 300px;">Cost- Rs.1500/-</button>
</div>
</div>
   
</div>


  
</div>

    </div>

                                        <div class="box">
        <img src="<%= ResolveUrl("~/img/con8.jpg") %>" alt="Feature 2" />
      <div class="overlay">
    <h3> Skin Care & Disease</h3>
    <p>This Package focuses on diagnosing and treating various skin conditions, offering specialized care for diseases like eczema, psoriasis, acne, and more, with customized treatments to restore skin health.</p>

   
<div class="buttons">
<div class="d-grid gap-2 d-md-flex justify-content-center">
    <div class="d-grid gap-2">
  <button class="btn btn-primary btn-sm" style="width: 300px;">Cost- Rs.1800/-</button>
</div>
</div>
   
</div>


  
</div>

    </div>

                                        <div class="box">
        <img src="<%= ResolveUrl("~/img/con9.jpg") %>" alt="Feature 2" />
      <div class="overlay">
    <h3>Dermatology Insight</h3>
    <p>The Dermatology Insight and Treatment package provides expert diagnosis and treatment for a wide range of skin conditions, from acne to advanced skin diseases, using the latest medical technologies for effective results.</p>

   
<div class="buttons">
<div class="d-grid gap-2 d-md-flex justify-content-center">
    <div class="d-grid gap-2">
  <button class="btn btn-primary btn-sm" style="width: 300px;">Cost- Rs.950/-</button>
</div>
</div>
   
</div>


  
</div>

    </div>

                                        <div class="box">
        <img src="<%= ResolveUrl("~/img/con10.jpg") %>" alt="Feature 2" />
      <div class="overlay">
    <h3>Flawless Laser</h3>
    <p>This treatment offers a comprehensive solution for skin rejuvenation, targeting imperfections like pigmentation, fine lines, and uneven texture. It helps achieve smooth, radiant skin with lasting results.</p>

   
<div class="buttons">
<div class="d-grid gap-2 d-md-flex justify-content-center">
    <div class="d-grid gap-2">
  <button class="btn btn-primary btn-sm" style="width: 300px;">Cost- Rs.1300/-</button>
</div>
</div>
   
</div>


  
</div>

    </div>

                                        <div class="box">
        <img src="<%= ResolveUrl("~/img/con11.jpg") %>" alt="Feature 2" />
      <div class="overlay">
    <h3>DeepClean Laser</h3>
    <p>A powerful laser treatment designed to deeply cleanse the skin, removing impurities, acne scars, and blemishes. It helps promote clearer, smoother skin with a fresh, revitalized appearance.</p>

   
<div class="buttons">
<div class="d-grid gap-2 d-md-flex justify-content-center">
    <div class="d-grid gap-2">
  <button class="btn btn-primary btn-sm" style="width: 300px;">Cost- Rs.1500/-</button>
</div>
</div>
   
</div>


  
</div>

    </div>
                                   
                  <div class="box">
        <img src="<%= ResolveUrl("~/img/con12.jpg") %>" alt="Feature 2" />
      <div class="overlay">
    <h3>Youthful Laser</h3>
    <p>: A rejuvenating laser treatment that targets fine lines, wrinkles, and skin sagging. It stimulates collagen production, promoting a youthful, radiant complexion with firmer and smoother skin.</p>
   
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
</asp:Content>
