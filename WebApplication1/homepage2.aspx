<%@ Page Title="" Language="C#" MasterPageFile="~/navfooter.Master" AutoEventWireup="true" CodeBehind="homepage2.aspx.cs" Inherits="WebApplication1.homepage2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <!-- Custom CSS -->
 <link href="homepage3.css" rel="stylesheet" />


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <!-- Remix Icon CDN for Icons -->
  <link href="https://cdn.jsdelivr.net/npm/remixicon/fonts/remixicon.css" rel="stylesheet">
  <!-- Additional Fonts or Styling CDN -->
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/remixicon/fonts/remixicon.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
         <style>

              .testimonials-container {
                
                  margin-bottom:-50px;
     max-width: 1200px;
     margin: auto;
     padding: 2rem;
     font-family: 'Roboto', sans-serif;
     position: relative;
     overflow: hidden;
 }

 .testimonials-header {
     text-align: center;
     margin-bottom: 2rem;
 }

 .testimonials-header h2 {
     font-size: 2.5rem;
     color: #333333;
     font-weight: 700;
     text-transform: capitalize;
     letter-spacing: 1px;
     margin-bottom: 1rem;
 }

 .testimonials-header h2::after {
     content: "";
     display: block;
     width: 60px;
     height: 4px;
     background-color: #007BFF; /* Add an accent color */
     margin: 0.5rem auto 0;
     border-radius: 2px;
 }

 .swiper {
     width: 100%;
 }

 .swiper-wrapper {
     display: flex;
 }

 .swiper-slide {
     flex: 0 0 calc(33.33% - 15px); /* Adjusting space between cards */
     display: flex;
     justify-content: center;
 }

 .testimonial-card {
     background: linear-gradient(135deg, #F0FFFF, #DFF6FF); /* Gradient background */
     border-radius: 15px;
     box-shadow: 0 6px 10px rgba(0, 0, 0, 0.1), 0 2px 4px rgba(0, 0, 0, 0.06);
     padding: 2rem;
     text-align: center;
     transition: all 0.3s ease-in-out;
     width: 85%; /* Increase card width */
     position: relative;
 }

 .testimonial-card:hover {
     transform: scale(1.05);
     box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
 }

 .testimonial-card img {
     width: 100px;
     height: 100px;
     border-radius: 50%;
     object-fit: cover;
     margin-bottom: 1rem;
     border: 3px solid #007BFF; /* Accent border around the image */
 }

 .testimonial-card h4 {
     font-size: 1.4rem;
     color: #333333;
     margin: 1rem 0;
     font-weight: 600;
 }

 .testimonial-card p {
     font-size: 1rem;
     color: #555555;
     line-height: 1.6;
     margin: 0;
 }

 .swiper-button-next,
 .swiper-button-prev {
     color: #007BFF;
     font-size: 1.5rem;
 }

 .swiper-pagination-bullet {
     background-color: #007BFF; /* Styled pagination dots */
     opacity: 0.7;
 }

 .swiper-pagination-bullet-active {
     background-color: #0056b3;
     transform: scale(1.2);
 }

              :root {
    --primary-color: #4CAF50;
    --text-light: #555;
    --text-dark: #333;
    --grid-bg-color: azure;
    --hover-shadow: rgba(0, 0, 0, 0.2);
}
                    .doctors__container {
          max-width: 1200px;
          margin: auto;
          padding: 2rem;
          font-family: 'Roboto', sans-serif;
      }

      .doctors__header {
          display: flex;
          align-items: center;
          justify-content: space-between;
      }

      .doctors__header h2 {
          margin-left:0px;
          font-size: 2rem;
          color: var(--text-dark);
      }

      .doctors__header p {
          max-width: 600px;
          color: var(--text-light);
      }

      .doctors__nav {
          display: flex;
          align-items: center;
          gap: 1rem;
      }

      .doctors__nav span {
          font-size: 1.5rem;
          padding: 0.5rem 1rem;
          color: var(--primary-color);
          background-color: var(--primary-color-light);
          border-radius: 5px;
          cursor: pointer;
      }

      .doctors__grid {
          margin-top: 2rem;
          display: grid;
          grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
          gap: 2rem;
      }

      .doctors__card {
          text-align: center;
          background: azure;
          border-radius: 10px;
          box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
          overflow: hidden;
          border: 1px solid black;
          transition: transform 0.3s ease, box-shadow 0.3s ease;
      }

      .doctors__card:hover {
          transform: translateY(-10px);
          box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
      }

      .doctors__card img {
          width: 100%;
          height: 250px;
          object-fit: cover;
          box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
      }

      .doctors__card h4 {
          margin: 1rem 0 0.5rem;
          color: var(--text-dark);
      }

      .doctors__card p {
          margin: 0 0 1rem;
          color: var(--text-light);
      }

      .doctors__socials {
          display: flex;
          justify-content: center;
          gap: 1rem;
          margin: 1rem 0;
      }

      .doctors__socials span {
          font-size: 1.5rem;
          color: var(--primary-color);
          transition: color 0.3s;
          cursor: pointer;
      }

      .doctors__socials span:hover {
          color: var(--text-dark);
      }

.why__container {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 2rem;
    text-align: left;
    max-width: 1200px;
    margin: 0 auto;
    transform: translateX(-30px); /* Shift the container to the left */
}

.why__image img {
    width: 70%;
    max-width: 400px;
    height: auto;
    margin-bottom: 40px;
    border-radius: 10px;
    display: block;
    margin-left: auto;
    margin-top: 50px;
    transition: transform 0.3s, box-shadow 0.3s;
    box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.1);
     border: 2px solid black; /* Black border added */
}

.why__image img:hover {
    transform: scale(1.05);
    box-shadow: 8px 8px 20px var(--hover-shadow);
}

.why__content p {
    color: var(--text-light);
    line-height: 1.6;
    margin-top: 20px;
}

.why__grid {
    margin-top: 2rem;
    display: grid;
    grid-template-columns: 80px auto;
    gap: 1.5rem;
}

.why__grid span {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    font-size: 2.5rem;
    color: var(--primary-color);
    border-radius: 10px;
    background: var(--grid-bg-color);
    box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s, box-shadow 0.3s;
}

.why__grid span:hover {
    transform: translateY(-5px);
    box-shadow: 8px 8px 20px var(--hover-shadow);
}

.why__grid h4 {
    margin-bottom: 0.5rem;
    font-size: 1.2rem;
    font-weight: 600;
    color: var(--text-dark);
}

.why__grid p {
    color: var(--text-light);
    font-size: 0.9rem;
}

.section__header {
   font-size: 2rem;
      margin-left:0px;
 color: var(--text-dark);
} 



 .btn-custom {
     margin-top:10px;
        background-color: #90EE90; /* Light green */
        color: #fff;
        border: 2px solid #90EE90;
        font-weight: bold;
        font-size: 16px;
        border-radius: 5px;
        padding: 10px 20px;
        transition: all 0.3s ease;
        box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
    }

    .btn-custom:hover {
        background-color: #66c766; /* Darker green on hover */
        color: #fff;
        transform: scale(1.05); /* Slight zoom on hover */
    }

    .btn-custom:active {
        transform: scale(0.95); /* Slight shrink on click */
        box-shadow: 0 3px 8px rgba(0, 0, 0, 0.2);
    }

    .form-control {
        border-radius: 5px;
    }

    .form-label {
        font-size: 14px;
    }

    .card-header {
        border-radius: 5px 5px 0 0;
    }

    .card-body {
        background-color: #f9f9f9;
    }

    .file-upload-label {
        display: block;
        font-size: 14px;
        font-weight: bold;
        color: #28a745;
        margin-bottom: 10px;
    }
        /* Available features in our clinic */
.main .container1 {
    width: 98%;           /* Full width */
    max-width: 100%;      /* Ensures it doesn't exceed full width */
    margin: 0 auto;       /* Centering the container */
    background-color:azure;
    margin-top: -100px;   /* Adjust as needed */
    margin-bottom:50px;  /* Adjust as needed */
    padding-left: 0;      /* Optional: Remove padding if necessary */
    padding-right: 0;     /* Optional: Remove padding if necessary */
}


.main .container1 .col {
    flex-basis: 50%;
    margin-top: 100px;
    margin-bottom: 100px;
    width:100%;
}

.main h3 {
    display: flex;
    color: darkgoldenrod;
    font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
    font-size: 80px;
    position: relative;
    transition: color 0.3s ease, transform 0.3s ease;
    margin-top: 150px;
    text-shadow: 1px 1px;
}

.main h3::after {
    content: '';
    position: absolute;
    left: 0;
    bottom: 0;
    width: 100%;
    height: 5px;
    background-color: cadetblue;
    transform: scaleX(0);
    transition: transform 0.3s ease;
}

.main h3:hover {
    color: #00bcd4;
    transform: scale(1.05);
}

.main h3:hover::after {
    transform: scaleX(1);
}

.main .card {
    margin: 100px 50px 0px 30px;
    width: 270px;
    height: 240px;
    display: inline-block;
    border-radius: 10px;
    padding: 15px 25px;
    box-sizing: border-box;
    cursor: pointer;
    transition: transform 0.5s;
    background-position: center;
    background-size: cover;
    position: relative;
    overflow: hidden;
    text-align: center;
    border: 3px solid green;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
    margin-top: 20px;
}

.main .card h5 {
    position: absolute;
    bottom: 10px;
    left: 0;
    right: 0;
    text-align: center;
    color: #fff;
    background-color: rgba(0, 0, 0, 0.5);
    padding: 10px;
    margin: 0;
    border-bottom-left-radius: 10px;
    border-bottom-right-radius: 10px;
    transition: opacity 0.3s ease;
    opacity: 0;
}

.main .card:hover h5 {
    opacity: 1;
}

.main .card1 {
    background-image: url("img/1availablefeature.jpg");
}

.main .card2 {
    background-image: url("img/2availablefeature.jpg");
}

.main .card3 {
    background-image: url("img/3availablefeature.jpg");
}

.main .card4 {
    background-image: url("img/4availablefeature.jpg");
}

.main .card:hover {
    transform: translateY(-10px);
}

.text {
    font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
    font-size: 20px;
    color: darkblue;
    text-align: justify;
    display: flex;
    transition: all 0.5s ease;
}

.text:hover {
    transform: scale(1.05);
    color: #00bcd4;
}

/* Media Queries for Responsive Design */

@media (max-width: 576px) {
    .main .col:first-child h3 {
        font-size: 30px;
        margin-top: 80px;
        padding-top: 40px;
        margin-left: 100px;
    }
    .main .col:first-child .text {
        font-size: 18px;
        margin-top: 60px;
        padding-top: 40px;
        margin-left: 50px;
    }
    .cards-right {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-top: 20px;
    }
    .main 
}

@media (min-width: 576px) and (max-width: 768px) {
    .main .col:first-child h3 {
        font-size: 40px;
        margin-top: 50px;
        padding-top: 25px;
        margin-left: 100px;
    }
    .main .col:first-child .text {
        font-size: 20px;
        margin-top: 25px;
        padding-top: 25px;
        margin-left: 50px;
    }
    .cards-right {
        display: flex;
        flex-direction: column;
        align-items: flex-end;
        margin-left: auto;
        margin-top: 30px;
    }
    .main h3 {
    display: flex;
    color: darkgoldenrod;
    font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
    font-size: 40px;
    position: relative;
    transition: color 0.3s ease, transform 0.3s ease;
    margin-top: 150px;
    text-shadow: 1px 1px;
    margin-left:80px;
}
}

@media (max-width: 768px) {
    .main .col:first-child h3 {
        font-size: 35px;
        margin-top: 50px;
        padding-top: 25px;
        margin-left: 100px;
    }
    .main .col:first-child .text {
        font-size: 18px;
        margin-top: 30px;
        padding-top: 30px;
        margin-left: 50px;
    }
    .cards-right {
        display: flex;
        flex-direction: column;
        align-items: flex-end;
        margin-left: auto;
        margin-top: 30px;
    }
}

@media (min-width: 768px) and (max-width: 1024px) {
    .main .col:first-child h3 {
        font-size: 50px;
        margin-top: 60px;
        padding-top: 30px;
        margin-left: 100px;
    }
    .main .col:first-child .text {
        font-size: 20px;
        margin-top: 35px;
        padding-top: 30px;
        margin-left: 50px;
    }
    .cards-right {
        display: flex;
        flex-direction: column;
        align-items: flex-end;
        margin-left: auto;
        margin-top: 40px;
    }
}
             <%-- Logo, clinic name  --%>
 .banner {
    display: flex;
    align-items: center;
    justify-content: center; /* Center content horizontally */
    background-color: aliceblue;
    padding: 50px 20px;
    flex-wrap: wrap;
}

.banner .img_deg {
    max-width: 500px; /* Increased max-width */
    height: auto; /* Keep height proportional */
    margin-right: 20px;
}

.banner-content {
    flex: 1;
    padding: 0;
    min-width: 400px; /* Ensures content width prevents wrapping on larger screens */
    margin: 0; /* Remove left margin */
    text-align: center; /* Center text for better alignment */
}

.banner-content h1 {
    font-size: 4rem;
    font-family: "Anton", sans-serif;
    font-weight: bold;
    /*color: #ff4500;*/
  
    margin: 0;
    transition: transform 0.3s ease; /* Add transition for slight hover effect */
}
.banner-content h4 {
    font-size: 2rem;
    font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
    font-weight: bold;
    color: #ff4500;
    text-shadow: 3px 3px 15px rgba(0, 0, 0, 0.4), /* Main shadow */
                 -1px -1px 4px rgba(255, 69, 0, 0.5); /* Additional glow shadow */
    margin: 0.5rem 0;
    transition: transform 0.3s ease;
}
/* Add a hover effect to make the text scale slightly */
.banner-content h1:hover,
.banner-content h4:hover {
    transform: scale(1.05);
}

.banner-content h4 {
    font-size: 2rem;
    font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
    font-weight: bold;
    color: #ff4500;
    text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.3); /* Added shadow to text */
    margin: 0.5rem 0;
}

/* Enhanced button styling */
.button-link {
    width: 45%;
    background-color: #4CAF50;
    color: white;
    padding: 15px;
    font-size: 18px;
    margin-top: 50px;
    cursor: pointer;
    border-radius: 12px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2); /* Subtle shadow effect */
    transition: all 0.3s ease; /* Smooth transition effect */
    text-transform: uppercase; /* Make text uppercase */
    font-weight: bold;
    letter-spacing: 1px;
    border: none;
}

.button-link:hover {
    background-color: #ffffff;
    color: #4CAF50;
    border: 2px solid #4CAF50;
    box-shadow: 0px 6px 20px rgba(0, 0, 0, 0.3); /* High shadow effect on hover */
    transform: translateY(-3px); /* Slight lift effect */
}

/* Adjustments for medium-sized screens */
@media (max-width: 1200px) {
    .banner-content {
        min-width: 300px; /* Adjust as needed for medium screens */
    }
}

/* Adjustments for small screens */
@media (max-width: 768px) {
    .banner {
        flex-direction: column;
        text-align: center;
        padding: 20px 10px;
    }

    .banner .img_deg {
        margin: 0 auto 20px;
        max-width: 300px; /* Increased size for small screens */
    }

    .banner-content {
        margin: 0 10px; /* Center content for mobile screens */
    }

    .banner-content h1 {
        font-size: 2rem;
    }

    .banner-content h4 {
        font-size: 1.25rem;
    }

    .button-link {
        width: 100%;
        max-width: 250px;
        margin: 10px auto;
    }
}

      <%-- image Slider  --%>
        #myCarousel {
    width: 99vw; /* Full width of the viewport */
    position: relative; /* Ensure positioning for inner elements */
    overflow: hidden; /* Hide overflow to keep layout tidy */
    margin-top:0;

}
      /* Custom styles for carousel controls */
.carousel-control-prev-icon,
.carousel-control-next-icon {
  /* Set control background color to black */
    width: 40px;
    height: 40px;
    border-radius: 50%; /* Makes controls circular */
}

/* Optional: Add some opacity or hover effects */
.carousel-control-prev-icon:hover,
.carousel-control-next-icon:hover {
    opacity: 0.8; /* Slightly reduce opacity on hover */
}

.carousel-inner img {
    width: 100%; /* Ensure images take the full width */
    max-height: 500px; /* Optional: limit the height of the images */
    object-fit: cover; /* Ensures the image covers the area without distortion */
}

/* Optional: Style the carousel caption */
.carousel-caption {
    background: rgba(0, 0, 0, 0.5); /* Semi-transparent background */
    border-radius: 10px; /* Rounded corners for the caption background */
    padding: 15px; /* Padding inside the caption */
    font-size:20px;
}

/* Optional: Adjust font size for larger screens */
@media (min-width: 768px) {
    .carousel-caption h3 {
        font-size: 30px; /* Larger heading on larger screens */
    }
    .carousel-caption p {
        font-size: 18px; /* Larger paragraph text on larger screens */
    }
}

/* Styling for the form wrapper */



/*4 horizontal boxes*/
 .boxes4 {
    .what-we-provide {
        max-width: 1400px;
        width: 90%;
        margin: 50px auto;
        display: grid;
        grid-template-columns: repeat(4, 1fr); /* Initial layout for larger screens */
        gap: 20px;
        background-color:azure;
        margin-top:0px;
    }

    .w-info-box {
        display: flex;
        justify-content: flex-start;
        align-items: center;
        background-color: white;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        padding: 10px;
        border-radius: 5px;
    }

    .w-info-box:hover {
        transform: translateY(-10px);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }

    .w-info-icon {
        width: 60px;
        height: 60px;
        display: flex;
        justify-content: center;
        align-items: center;
        margin-right: 15px;
        font-size: 1.4rem;
        border-radius: 5px;
    }

    .w-info-box1 .w-info-icon {
        background-color: mediumpurple;
    }

    .w-info-box2 .w-info-icon {
        background-color: aqua;
    }

    .w-info-box3 .w-info-icon {
        background-color: aquamarine;
    }

    .w-info-box4 .w-info-icon {
        background-color: cornflowerblue;
    }

    .w-info-text {
        display: flex;
        flex-direction: column;
    }

    .w-info-text strong {
        color: #122853;
        font-weight: 700;
    }

    .w-info-text p {
        color: #535353;
        font-size: 0.9rem;
        letter-spacing: 0.3px;
    }
}

/* Media queries for responsive design */

/* For tablets and small screens */
@media (max-width: 1024px) {
    .boxes4 .what-we-provide {
        grid-template-columns: repeat(2, 1fr); /* 2 columns layout */
    }
}

/* For mobile phones */
@media (max-width: 600px) {
    .boxes4 .what-we-provide {
        grid-template-columns: 1fr; /* Single column layout */
    }

    .w-info-box {
        padding: 15px;
    }

    .w-info-icon {
        width: 50px;
        height: 50px;
        font-size: 1.2rem;
        margin-right: 10px;
    }

    .w-info-text p {
        font-size: 0.8rem;
    }
}

 /*OUR SPECIALITY*/
.specific {
    /* Your other styles here */


.row {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    height: 88%;
}
     .container {
         max-width:1400px;
         margin-top:-100px;
         margin-bottom:50px;
         
     }

.col {
    flex-basis: 50%;
   /* padding: 20px;*/
    margin-top: 80px;
    margin-bottom: 0px;
}

.card {
    background-color:antiquewhite;
    width: 270px;
    border:3px solid green;
    height: 240px;
    display: inline-block;
    border-radius: 10px;
    cursor: pointer;
    margin: 10px; /* Reduced margin */
    background-position: center;
    background-size: cover;
    padding: 15px 25px;
    box-sizing: border-box;
    position: relative;
    overflow: hidden;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    box-shadow:rgba(0,0,0,0.8);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
}

.card1 {
    background-image: url("img/1removaloftatto.jpg");
}

.card2 {
    background-image: url("img/2keratin.jpeg");
}

.card3 {
    background-image: url("img/3scalp.jpg");
}

.card4 {
    background-image: url("img/4facecleaning.jpg");
}

.card img {
    width: 100%;
    height: 100%;
    border-radius: 10px;
    object-fit: cover;
    transition: transform 0.3s ease;
}
.text {
    font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
    font-size: 20px;
    color: darkblue;
    text-align: justify;
    display: flex;
    transition: all 0.5s ease;
}

.text:hover {
    transform: scale(1.05);
    color: #00bcd4;
}
.content {
    color: #fff;
    background: rgba(0, 0, 0, 0.8);
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    padding: 10px;
    box-sizing: border-box;
    transition: opacity 0.5s, transform 0.5s;
    opacity: 0;
    transform: translateY(100%);
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    text-align: center;
}

.card:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.7);
}

.card:hover img {
    transform: scale(1.1);
}

.card:hover .content {
    opacity: 1;
    transform: translateY(0);
}

.content h5 {
    margin: 0;
    font-size: 25px;
    font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
    font-weight: bold;
}

.content p {
    margin-top: 15px;
    font-size: 17px;
    padding: 10px 0;
    text-align: justify;
     border-top: 1px solid white; /* Added top border */
 border-bottom: 1px solid white; /* Added bottom border */
}

h3 {
    margin-left:100px;
    display: flex;
 color: darkgoldenrod;
 font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
 font-size: 80px;
 position: relative;
 transition: color 0.3s ease, transform 0.3s ease;
 margin-top: 0px;
 margin-bottom:20px;
 text-shadow: 1px 1px;
}

h3:hover {
    color: #00bcd4;
    transform: scale(1.05);
}

h3::after {
    content: '';
    position: absolute;
    left: 50%;
    bottom: -5px;
    width: 400px;
    height: 3px;
    background-color:antiquewhite;
    transform: translateX(-50%) scaleX(0);
    transition: transform 0.3s ease;
}

h3:hover::after {
    transform: translateX(-50%) scaleX(1);
}

.text-column {
    display: flex;
    flex-direction: column;
    justify-content: center;
    margin-right: -50px;
    padding-right: 20px;
    margin-top: -20px; /* Added negative margin to reduce space */
}

.text-column p {
    text-align: justify;
    font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
    line-height: 1.6;
    font-size:20px;
    display :flex;
    color:darkblue;
}
/* Media Query for Small Devices (max width: 576px) */
@media (max-width: 576px) {
    .container {
        max-width: 90%; /* Allow most of the screen width */
        margin-top: 20px; /* Adjust margin */
        margin-bottom: 20px; /* Adjust margin */
        margin-left: 5%; /* Move content slightly left */
    }

    .col {
        flex-basis: 100%; /* Full width columns */
        margin-top: 20px; /* Adjust spacing */
    }

    .card {
        width: 100%; /* Full width for cards */
        margin: 10px 0; /* Space cards vertically */
    }

    h3 {
        font-size: 24px; /* Smaller font size for headings */
    }

    .text-column p {
        font-size: 14px; /* Adjust font size for paragraphs */
    }
}

/* Media Query for Medium Devices (max width: 768px) */
@media (max-width: 768px) {
    .container {
        max-width: 90%; /* Allow most of the screen width */
        margin-top: 20px; /* Adjust margin */
        margin-bottom: 20px; /* Adjust margin */
        margin-left: 5%; /* Move content slightly left */
    }

    .col {
        flex-basis: 100%; /* Full width columns */
        margin-top: 20px; /* Adjust spacing */
    }

    .card {
        width: 100%; /* Full width for cards */
        margin: 10px auto; /* Center cards */
    }

    h3 {
        font-size: 28px; /* Smaller font size for headings */
    }

    .text-column p {
        font-size: 16px; /* Adjust font size for paragraphs */
    }
}

/* Media Query for Tablets (min width: 768px and max width: 1024px) */
@media (min-width: 768px) and (max-width: 1024px) {
    .container {
        max-width: 80%; /* Set maximum width for tablets */
        margin-top: 30px; /* Increased margin for spacing */
        margin-left: 5%; /* Move content slightly left */
    }

    .col {
        flex-basis: 50%; /* Two columns for tablet view */
        margin-top: 30px; /* Adjust spacing */
    }

    .card {
        width: 90%; /* Responsive width for cards */
        margin: 10px auto; /* Center cards */
    }

    h3 {
        font-size: 36px; /* Moderate size for headings */
    }

    .text-column p {
        font-size: 18px; /* Adjust font size for readability */
    }
}

/* Media Query for Laptops (min width: 1024px and max width: 1366px) */
@media (min-width: 1024px) and (max-width: 1366px) {
    .container {
        max-width: 1200px; /* Set a maximum width for larger screens */
        margin-top: 50px; /* Increased margin for spacing */
        margin-left: 5%; /* Move content slightly left */
    }

    .col {
        flex-basis: 45%; /* Adjust column size for laptop view */
        margin-top: 40px; /* Increased top margin */
    }

    .card {
        width: 100%; /* Use full width of column */
        margin: 20px 0; /* Space out cards vertically */
    }

    h3 {
        font-size: 60px; /* Moderate size for headings */
    }

    .text-column p {
        font-size: 18px; /* Slightly larger font size for readability */
    }
}

    </style>


     <%-- logo aand clinic name--%>
      <div class="container-fluid">
    <div class="row align-items-center banner">
        <div class="col-md-4 col-12">
            <img src="img/logo.png" alt="Logo" class="img-fluid img_deg">
        </div>
        <div class="col-md-8 col-12 banner-content">
            <h1>DR.ZOPE'S CLINIC</h1>
            <h4>Skin & Laser Specialist</h4>
            
            <!-- Update ASP.NET Button with custom CSS class -->
           <asp:ScriptManager ID="ScriptManager1" runat="server" />

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <!-- Custom CSS for the button -->
        <asp:Button ID="Button1" CssClass="button-link" runat="server" Text="Book an Appointment" OnClick="Button1_Click" />
    </ContentTemplate>
</asp:UpdatePanel>
        </div>
    </div>
</div>

     <%-- Image slider--%>
        <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="2000">

    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
        <li data-target="#myCarousel" data-slide-to="3"></li>
        <li data-target="#myCarousel" data-slide-to="4"></li>
        <li data-target="#myCarousel" data-slide-to="5"></li>
        <li data-target="#myCarousel" data-slide-to="7"></li>
        <li data-target="#myCarousel" data-slide-to="8"></li>
    </ol>
    <!-- Wrapper for slides -->
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="img/imgslider/slider1.jpg" alt="Los Angeles">
            <div class="carousel-caption">
                <h2>Chemical Peels</h2>
                <p>A treatment that exfoliates the skin to improve texture and reduce signs of aging.</p>
              
            </div>
        </div>
        <div class="carousel-item">
            <img src="img/imgslider/slider2.jpg" alt="Chicago">
            <div class="carousel-caption">
                <h2>Fractional Laser Resurfacing</h2>
                <p>A procedure that uses laser technology to rejuvenate the skin by reducing wrinkles and scars.</p>
            </div>
        </div>
        <div class="carousel-item">
            <img src="img/imgslider/slider4.jpg" alt="New York">
            <div class="carousel-caption">
                <h2>Laser Hair Removal</h2>
                <p>A precise method to permanently reduce unwanted hair using concentrated laser light</p>
            </div>
        </div>
        <div class="carousel-item">
            <img src="img/imgslider/slider3.png" alt="New York">
            <div class="carousel-caption">
                <h2>Melasma Treatment</h2>
                <p>Specialized treatments aimed at reducing dark patches on the skin caused by hormonal changes</p>
            </div>
        </div>
         <div class="carousel-item">
     <img src="img/imgslider/slider5.jpg" alt="New York">
     <div class="carousel-caption">
         <h2>Beard Styling</h2>
         <p>A precise method to permanently reduce unwanted hair using concentrated laser light</p>
     </div>
 </div>
         <div class="carousel-item">
     <img src="img/imgslider/slider6.jpg" alt="New York">
     <div class="carousel-caption">
         <h2>Keratin Treatment</h2>
         <p>A precise method to permanently reduce unwanted hair using concentrated laser light</p>
     </div>
 </div>
                <div class="carousel-item">
    <img src="img/imgslider/slider7.jpg" alt="New York">
    <div class="carousel-caption">
        <h2>Botox Injections</h2>
        <p>Non-surgical injections that temporarily smooth out wrinkles and fine lines by relaxing facial muscles.</p>
    </div>
</div>
                <div class="carousel-item">
    <img src="img/imgslider/slider8.jpg" alt="New York">
    <div class="carousel-caption">
        <h2>Microneedling</h2>
        <p>A treatment that uses tiny needles to stimulate collagen production, improving skin texture and reducing scars.</p>
    </div>
</div>
    </div>
    <!-- Left and right controls -->
    <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
   
    <%-- 4 horizontal boxes --%>
           <div class="boxes4">
   <section class="what-we-provide">
       <%--box1--%>
       <div class="w-info-box w-info-box1">
           <div class="w-info-icon">
              <i class="fa-solid fa-book"></i>
           </div>

           <div class="w-info-text">
               <strong>Specified Service</strong>
               <p>Lorem ipsum dol</p>
           </div>
       </div>

        <%--box2--%>
        <div class="w-info-box w-info-box2">
    <div class="w-info-icon">
        <i class="fa-regular fa-comment"></i>
    </div>

    <div class="w-info-text">
        <strong>24/7 Appointments</strong>
        <p>Lorem ipsum dol</p>
    </div>
</div>

        <%--box3--%>
        <div class="w-info-box w-info-box3">
    <div class="w-info-icon">
        <i class="fa-solid fa-laptop"></i>
    </div>

    <div class="w-info-text">
        <strong>Online Consultation</strong>
        <p>Lorem ipsum dol</p>
    </div>
</div>
        <%--box4--%>

        <div class="w-info-box w-info-box4">
    <div class="w-info-icon">
      <i class="fa-solid fa-notes-medical"></i>
    </div>

    <div class="w-info-text">
        <strong>Pharma</strong>
        <p>Lorem ipsum dol</p>
    </div>
</div>
       
   </section>
       </div>

     <%-- Speciality --%>
              

               <div class="specific">
    <section style="background-color: aliceblue;">
        <div class="container">
        <div class="row">
            <div class="col">
                <div class="card card1 "  style="margin-left:5px;">
                    <div class="content">
                        <h5>Dermabrasion</h5>

                        <p><i><small>Laser tattoo removal is the process of using laser light energy to shatter tattoo ink into small particles, which the body's immune system clears over time.</small></i></p>
                    </div>
                </div>
                <div class="card card2" style="margin-left:5px;">
                    <div class="content">
                        <h5>Keratin Treatment</h5>
                        <p><i><small>Keratin treatment is a smoothing treatment that eliminates frizz and adds shine to the hair. It helps to make hair straight, silky, and more manageable.</small></i></p>
                    </div>
                </div>
                <div class="card card3" style="margin-left:5px;">
                    <div class="content">
                        <h5>Scalp Treatment</h5>
                        <p><i><small>Scalp treatment refers to various treatments aimed at maintaining a healthy scalp and promoting hair growth. It may include cleansing, moisturizing, and addressing scalp conditions.</small></i></p>
                    </div>
                </div>
                <div class="card card4">
                    <div class="content">
                        <h5>Face Cleaning</h5>
                        <p><i><small>Face cleaning treatment involves deep cleansing of the face to remove dirt, oil, and impurities. It helps to unclog pores, prevent acne, and promote healthier-looking skin.</small></i></p>
                    </div>
                </div>
            </div>
            <div class="col text-column">
            <h3>Our Speciality</h3>
                <div class="text">
                <p>Our clinic specializes in providing advanced skincare and laser treatments tailored to individual needs. We use the latest technology to offer a wide range of services, from laser hair removal and skin rejuvenation to anti-aging therapies. Our team of experienced professionals is dedicated to helping you achieve healthy, radiant skin with personalized treatment plans. Whether you’re seeking
                    solutions for acne scars, pigmentation, or signs of aging, we prioritize safe and effective methods for lasting results. At our clinic, patient care and satisfaction are our top priorities, ensuring a comfortable experience in a professional environment.</p>
            </div>
                </div>
        </div>
            </div>
    </section>
</div>

      <%-- Available features in our clinic--%>
         <div class="main">
    <div class="container1">
      <div class="row">
    <div class="col">
       <h3 style="margin-top:20px;margin-left:60px;">Available Features in our clinic</h3><br />

        <div class="text"style="margin-left:40px;">
            <p>Our skin and laser clinic offers a wide range of modern treatments and personalized care to help with various skin concerns. Our available services include laser hair removal for long-term hair reduction, skin resurfacing to reduce acne scars, fine lines, and uneven pigmentation, as well as specialized facials and chemical peels for brighter, healthier skin. We also provide anti-aging options, such as Botox and 
                dermal fillers, and non-surgical body contouring to achieve a toned look. Each treatment is provided by skilled professionals using advanced equipment and safe, medically approved techniques to ensure effective results
</p>
        </div>
    </div>
    <div class="col cards-right" style="margin-left:0;"> <!-- Add 'cards-right' class here -->
        <div class="card card1 "style="margin-left:30px;">
            <h5>WELL EDUCATED STAFF</h5>
        </div>
        <div class="card card2 ">
            <h5>PHARMA</h5>
        </div>
        <div class="card card3"style="margin-left:30px;">
            <h5>HIGH TECH MACHINERY</h5>
        </div>
        <div class="card card4 ">
            <h5>WELLED INFRASTRUCTURE</h5>
        </div>
    </div>
</div>

    </div>
</div>

       <div class="section__container why__container">
    <div class="why__image">
        <img src="img/chooseus.jpg" alt="Why Choose Us" />
    </div>
    <div class="why__content">
        <h2 class="section__header">Why Choose Us</h2>
        <p>
            At our state-of-the-art skin and laser treatment clinic, we are dedicated to helping you achieve radiant and healthy skin. Our team of certified dermatologists and specialists ensures personalized care with cutting-edge solutions tailored to your needs.
        </p>
        <div class="why__grid">
            <span><i class="ri-magic-line"></i></span>
            <div>
                <h4>Advanced Laser Treatments</h4>
                <p>
                    We offer the latest laser technology to effectively treat pigmentation, scars, and unwanted hair, delivering safe and lasting results.
                </p>
            </div>
           <span><i class="ri-user-smile-line"></i></span>

            <div>
                <h4>Personalized Skin Care</h4>
                <p>
                    Our customized skin care regimens are designed to rejuvenate your skin, addressing acne, wrinkles, and other concerns.
                </p>
            </div>
            <span><i class="ri-surgical-mask-line"></i></span>
            <div>
                <h4>Expert Dermatologists</h4>
                <p>
                    Our experienced team ensures professional care for all your dermatological needs, from consultations to advanced procedures.
                </p>
            </div>
        </div>
    </div>
</div>

      <div class="doctors__container">
      <div class="doctors__header">
          <div>
              <h2>Our Special Doctors</h2>
              <p>Meet our experienced and specialized team of doctors who provide exceptional care.</p>
          </div>
          <div class="doctors__nav">
              <span><i class="ri-arrow-left-line"></i></span>
              <span><i class="ri-arrow-right-line"></i></span>
          </div>
      </div>

      <div class="doctors__grid">
          <div class="doctors__card">
              <img src="img/doctor-08.jpg" alt="Dr. Emily Smith">
              <h4>Dr. Aniruddha Zope</h4>
              <p>Teledermatologist</p>
              <div class="doctors__socials">
                  <span><i class="ri-instagram-line"></i></span>
                  <span><i class="ri-facebook-fill"></i></span>
                  <span><i class="ri-twitter-fill"></i></span>
              </div>
          </div>

          <div class="doctors__card">
              <img src="img/doctor-01.jpg" alt="Dr. James Anderson">
              <h4>Dr. Sneha Zope</h4>
              <p>Dermatologist</p>
              <div class="doctors__socials">
                  <span><i class="ri-instagram-line"></i></span>
                  <span><i class="ri-facebook-fill"></i></span>
                  <span><i class="ri-twitter-fill"></i></span>
              </div>
          </div>

          <div class="doctors__card">
              <img src="img/doctor-12.jpg" alt="Dr. Michael Lee">
              <h4>Dr. Amol Zope</h4>
              <p>Dermatologist</p>
              <div class="doctors__socials">
                  <span><i class="ri-instagram-line"></i></span>
                  <span><i class="ri-facebook-fill"></i></span>
                  <span><i class="ri-twitter-fill"></i></span>
              </div>
          </div>
      </div>
  </div>

    <%-- Feedback form --%>

  
<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-md-10 col-lg-8">
            <div class="card shadow-lg">
                <!-- Header -->
                <div class="card-header bg-gradient bg-success text-white text-center">
                    <h3 class="mb-0">Feedback Form</h3>
                </div>
                <!-- Form Body -->
                <div class="card-body">
                    <asp:Panel ID="pnlFeedback" runat="server">
                        <div class="row g-4">
                            <!-- Name Input -->
                            <div class="col-md-6">
                                <label for="txtName" class="form-label text-success fw-bold">Name</label>
                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control border-success shadow-sm" placeholder="Your Name"></asp:TextBox>
                            </div>

                            <!-- Email Input -->
                            <div class="col-md-6">
                                <label for="txtEmail" class="form-label text-success fw-bold">Email</label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control border-success shadow-sm" TextMode="Email" placeholder="Your Email"></asp:TextBox>
                            </div>

                            <!-- Subject Input -->
                            <div class="col-md-12">
                                <label for="txtSubject" class="form-label text-success fw-bold">Subject</label>
                                <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control border-success shadow-sm" placeholder="Subject"></asp:TextBox>
                            </div>

                            <!-- Message Input -->
                            <div class="col-md-12">
                                <label for="txtMessage" class="form-label text-success fw-bold">Message</label>
                                <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control border-success shadow-sm" TextMode="MultiLine" Rows="5" placeholder="Your Message"></asp:TextBox>
                            </div>

                            <!-- Image Upload Input -->
                            <div class="col-md-12">
                                <label for="fileUpload" class="file-upload-label text-success">Upload Image (Optional)</label>
                                <asp:FileUpload ID="fileUpload" runat="server" CssClass="form-control" />
                            </div>

                            <!-- Submit Button -->
                            <div class="col-md-12 text-center">
                                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-custom" OnClick="btnSubmit_Click" />
                            </div>
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>
</div>




     <div class="testimonials-container">
     <div class="testimonials-header">
         <h2>What our Patients say about us.</h2>
     </div>
     <div class="swiper">
         <div class="swiper-wrapper" id="testimonialsSlider">
             <asp:Repeater ID="rptTestimonials" runat="server">
                 <ItemTemplate>
                     <div class="swiper-slide">
                         <div class="testimonial-card">
                             <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("p_name") %>' />
                             <p><%# Eval("p_message") %></p>
                             <h4><%# Eval("p_name") %></h4>
                         </div>
                     </div>
                 </ItemTemplate>
             </asp:Repeater>
         </div>
         <!-- Navigation buttons -->
         <div class="swiper-button-next"></div>
         <div class="swiper-button-prev"></div>
         <!-- Pagination -->
         <div class="swiper-pagination"></div>
     </div>
 </div>

      <script>
      var swiper = new Swiper(".swiper", {
          slidesPerView: 3,
          spaceBetween: 20,
          grabCursor: true,
          loop: true,
          navigation: {
              nextEl: ".swiper-button-next",
              prevEl: ".swiper-button-prev",
          },
          pagination: {
              el: ".swiper-pagination",
              clickable: true,
          },
      });
   </script>
      
</asp:Content>
