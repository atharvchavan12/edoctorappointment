<%@ Page Title="" Language="C#" MasterPageFile="~/navfooter.Master" AutoEventWireup="true" CodeBehind="aboutus.aspx.cs" Inherits="WebApplication1.aboutus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <style>
     .our-story {
         background-color: aliceblue;
         max-width: 1200px;
         width: 90%;
         margin: 80px auto;
         border: 10px solid #ffffff;
         box-shadow: 2px 2px 30px rgba(0, 0, 0, 0.12);
         display: grid;
         grid-template-columns: 1fr 1fr;
         align-items: center;
         gap: 20px;
         padding: 20px;
     }
     .our-story-img {
         width: 100%;
         height: 100%;
         position: relative;
         border:1px solid black;
     }
     .our-story-img img {
         width: 100%;
         height: 100%;
         object-fit: cover;
         object-position: center;
     }
     
   
     .our-story-text {
         display: flex;
         flex-direction: column;
         justify-content: center;
         align-items: flex-start;
         padding: 50px;
     }
     .our-story-text h2 {
         font-size: 2.8rem;
         color:darkblue;
         line-height: 3rem;
         font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif
     }
     .our-story-text p {
         font-size: 0.9rem;
         color: #535353;
         margin: 10px 0px;
         line-height: 1.4rem;
         letter-spacing: 0.3px;
     }
     .story-number-container {
         display: grid;
         grid-template-columns: 1fr 1fr;
         grid-gap: 20px;
         margin-top: 20px;
     }
     .story-number-box {
         height:100px;
         width:200px;
         padding: 40px;
         display: flex;
         flex-direction: column;
         justify-content: center;
         align-items: center;
         border-radius: 10px;
         transition: transform 0.3s, box-shadow 0.3s;
         border:1px solid green;
     }
     .story-number-box:hover {
         transform: scale(1.05);
         box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
     }
     .story-number-box strong {
         color: #122853;
         font-weight: 700;
         font-size: 1.8rem;
     }
     .story-number-box span {
         color: #535353;
         font-size: 0.9rem;
     }
     .s-n-box1 {
         background-color: #d4dfff;
     }
     .s-n-box2 {
         background-color: #d4d7ff;
     }
     .s-n-box3 {
         background-color: #ffd4fd;
     }
     .s-n-box4 {
         background-color: antiquewhite;
     }

     @media (max-width: 768px) {
         .our-story {
             grid-template-columns: 1fr;
             padding: 10px;
         }
         .our-story-text {
             padding: 20px;
         }
         .story-number-container {
             grid-template-columns: 1fr;
         }
         .story-number-box {
             padding: 10px;
         }
         .our-story-text h2 {
             font-size: 2rem;
             line-height: 2.2rem;
         }
         .our-story-text p {
             font-size: 0.8rem;
             line-height: 1.2rem;
         }
     }
 </style>

   <section class="our-story">
      <div class="our-story-img">
          <img src="img/1availablefeature.jpg" />
      </div>
      <div class="our-story-text">
          <h2>DR.ZOPE'S CLINIC</h2>
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
          <div class="story-number-container">
              <div class="story-number-box s-n-box1">
                  <strong>1000+</strong>
                  <span>Happy Patients</span>
              </div>
              <div class="story-number-box s-n-box2">
                  <strong>2+</strong>
                  <span>Expert Doctors</span>
              </div>
              <div class="story-number-box s-n-box3">
                  <strong>20+</strong>
                  <span>Machinery</span>
              </div>
              <div class="story-number-box s-n-box4">
                  <strong>800+</strong>
                  <span>Patient Trust</span>
              </div>
          </div>
      </div>
  </section>
</asp:Content>
