<%@ Page Title="" Language="C#" MasterPageFile="~/navfooter.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="WebApplication1.homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
   <script>
       // JavaScript code here
       document.getElementById('feedbackForm').addEventListener('submit', function (event) {
           event.preventDefault();

           const name = document.getElementById('name').value;
           const email = document.getElementById('email').value;
           const message = document.getElementById('message').value;

           // Simulate form submission
           setTimeout(() => {
               const responseDiv = document.getElementById('feedback-response');
               responseDiv.textContent = 'Thank you for your feedback, ' + name + '!';
               responseDiv.style.color = 'green';

               // Clear the form
               document.getElementById('feedbackForm').reset();
           }, 1000);
       });
  </script>
      
        <!-- Bootstrap CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <!-- DataTables CSS -->
    <link href="datatables/css/dataTables.dataTables.min.css" rel="stylesheet" />
    <!-- FontAwesome CSS -->
    <link href="fontawesome/css/all.css" rel="stylesheet" />
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <!-- Popper JS -->
    <script src="bootstrap/js/popper.min.js"></script>
    <!-- Bootstrap JS -->
 <%--   <script src="bootstrap/js/bootstrap.min.js"></script>--%>
    <!-- FontAwesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- Custom CSS -->
    <link href="homepage3.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<style>
<%--     
 /*zopes clinic and logo*/
       .banner {
        display: flex;
        align-items: center;
        background-color: aliceblue;
        padding: 50px 20px;
        flex-wrap: wrap;
    }

    .banner .img_deg {
        max-width: 400px;
        height: auto;
        margin-right: 20px;
    }

    /* Default for large screens */
    .banner-content {
        flex: 1;
        padding: 0;
        margin-left: 400px; /* Only for large screens */
    }

    .banner-content h1 {
        font-size: 4rem;
        font-family: "Anton", sans-serif;
        font-weight: bold;
        color: #ff4500;
        text-shadow: 2px 2px 10px black;
        margin: 0;
    }

    .banner-content h4 {
        font-size: 2rem;
        font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
        font-weight: bold;
        color: #ff4500;
        text-shadow: 1px 1px 2px black;
        margin: 0.5rem 0;
    }

    .button-link {
        background-color: #4CAF50;
        color: white;
        padding: 15px;
        font-size: 18px;
        margin-top: 50px;
        cursor: pointer;
        border-radius: 12px;
        transition-duration: 0.4s;
    }
    .button-link:hover {
        background-color: white;
        color: black;
        border: 2px solid #4CAF50;
    }

    /* Adjustments for medium-sized screens */
    @media (max-width: 1200px) {
        .banner-content {
            margin-left: 130px; /* Reduce margin for tablets and smaller screens */
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
            max-width: 250px;
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
    --%>

/*box4*/
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
     display: flex;
 color: darkgoldenrod;
 font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
 font-size: 80px;
    position: relative;
    margin-top: 10px; /* Reduced from 20px to 10px */
    margin-bottom:30px;
    text-align: center;
    transition: color 0.3s ease, transform 0.3s ease;
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

@media (max-width: 768px) {
    .col {
        flex-basis: 100%;
        padding: 10px;
    }

    h3 {
        font-size: 40px;
    }

    .card {
        width: 100%;
    }
}
}

   /* Available features in our clinic */
   .main {
       .container {
           max-width: 1400px;
           margin-bottom: -100px;
           margin-top: -115px;
           /* background-color:azure; */
       }

       .col {
           flex-basis: 50%;
           margin-top: 100px;
           margin-bottom: 100px;
       }

       h3 {
           display: flex;
           color: darkgoldenrod;
           font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
           font-size: 80px;
           position: relative;
           transition: color 0.3s ease, transform 0.3s ease;
           margin-top: 150px;
           text-shadow: 1px 1px;
       }

       h3::after {
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

       h3:hover {
           color: #00bcd4;
           transform: scale(1.05);
       }

       h3:hover::after {
           transform: scaleX(1);
       }

       .card {
           margin: 10px;
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
           border-radius: 10px;
           border: 3px solid green;
           box-shadow: rgba(0, 0, 0, 0.8);
           box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
          padding:15px 25px; /* Added margin-left to shift the cards to the right */
       }

       .card h5 {
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

       .card:hover h5 {
           opacity: 1;
       }

       .card1 {
           background-image: url("img/1availablefeature.jpg");
       }

       .card2 {
           background-image: url("img/2availablefeature.jpg");
       }

       .card3 {
           background-image: url("img/3availablefeature.jpg");
       }

       .card4 {
           background-image: url("img/4availablefeature.jpg");
       }

       .card:hover {
           transform: translateY(-10px);
       }
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

   @media (max-width: 768px) {
       .card {
           margin: 100%;
       }
   }
   /*feedback form*/
  
 

   .main1-feedback {
      display: flex;
      align-items: center;
      justify-content: center;
      min-height: 100vh;
      background-color: aliceblue;
      padding-top:0px;
      margin-bottom:-200px;
  }

  .contain {
      width: 500px;
      background: #808080;
      box-shadow: 0 0 6px rgba(250, 250, 250, 0.6);
      border-radius: 8px;
      margin-top:-200px;
  }

  .contain form {
      width: 100%;
      text-align: center;
      padding: 25px 20px;
  }

form h1 {
      padding: 15px 0;
     margin-bottom: 20px;
      color: #ffffff;
      font-size: 30px;
      font-weight: bold;
      background-color: #4CAF50;
       text-align: center;
       text-transform: uppercase;
        border-radius: 5px;
       border-radius: 5px;
   /*   box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);*/
      
  }

  form .id {
      position: relative;
      margin-bottom: 10px;
  }

  .id i {
      position: absolute;
      font-size: 20px;
      top: 50%;
      right: 20px;
      transform: translateY(-50%);
      color: #ffffff;
  }

  form input,
  form textarea {
      width: 100%;
      height: 50px;
      margin: 4px 0;
      border: 1px solid #808080;
      border-radius: 3px;
      background: #181717;
      padding: 0 15px;
      font-size: 20px;
      color: #ffffff;
      padding-right:45px;
  }

  form textarea {
      height: auto;
      padding: 5px 15px;
      margin-top: 5px;
  }

  form button {
      background-color: aqua;
      color: black;
      padding: 10px 0;
      width: 100%;
      font-size: 20px;
      font-weight: 800;
      cursor: pointer;
      border: none;
      border-radius: 3px;
      margin-top: 10px;
  }

  form input:focus,
  form textarea:focus {
      border: 1px solid aqua;
      color: aqua;
      transition: all 0.3s ease;
  }

  form input:focus::placeholder,
  form textarea:focus::placeholder {
      padding-left: 4px;
      color: aqua;
      transition: all 0.3s ease;
  }

  form input:focus + i {
      color: aqua;
      transition: all 0.3s ease;
  }

  </style>
<div class="container-fluid">
    <div class="row align-items-center banner">
        <div class="col-md-4 col-12">
            <img src="img/logo.png" alt="Logo" class="img-fluid img_deg">
        </div>
        <div class="col-md-8 col-12 banner-content">
            <h1>DR. ZOPE'S CLINIC</h1>
            <h4>Skin & Laser Specialist</h4>
            <a href="rough.html" class="btn btn-primary button-link">BOOK AN APPOINTMENT</a>
        </div>
    </div>
</div>

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
                                          
 <div class="specific">
    <section style="background-color: aliceblue;">
        <div class="container">
        <div class="row">
            <div class="col">
                <div class="card card1">
                    <div class="content">
                        <h5>Dermabrasion</h5>

                        <p><i><small>Laser tattoo removal is the process of using laser light energy to shatter tattoo ink into small particles, which the body's immune system clears over time.</small></i></p>
                    </div>
                </div>
                <div class="card card2">
                    <div class="content">
                        <h5>Keratin Treatment</h5>
                        <p><i><small>Keratin treatment is a smoothing treatment that eliminates frizz and adds shine to the hair. It helps to make hair straight, silky, and more manageable.</small></i></p>
                    </div>
                </div>
                <div class="card card3">
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
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat</p>
            </div>
        </div>
            </div>
    </section>
</div>

  <div class="main">
      <div class="container">
          <div class="row">
              <div class="col">
                  <h3 style="margin-top:-10px;">Available Features <br />in our clinic</h3><br />
                  <div class="text">
                      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                      </p>
                  </div>
              </div>
              <div class="col">
                  <div class="card card1 ">
                      <h5>WELL EDUCATED STAFF</h5>
                  </div>
                  <div class="card card2 ">
                      <h5>PHARMA</h5>
                  </div>
                  <div class="card card3">
                      <h5>HIGH TECH MACHINERY</h5>
                  </div>
                  <div class="card card4 ">
                      <h5>WELLED INFRASTRUCTURE</h5>
                  </div>
              </div>
          </div>
      </div>
  </div>

     <div class="main1-feedback">
      <div class="contain">
          <form id="feedbackForm">
              <h1>DROP US A FEEDBACK</h1>
              <div class="id">
                  <input id="name" type="text" placeholder="Full Name" required />
                  <i class="far fa-user"></i>
              </div>
              <div class="id">
                  <input id="email" type="email" placeholder="Email" required />
                  <i class="far fa-envelope"></i>
              </div>
              <div class="id">
                  <textarea id="message" cols="15" rows="5" placeholder="Enter your opinions here!" required></textarea>
              </div>
              <button type="submit">Send</button>
          </form>
          <div id="feedback-response"></div>
      </div>
  </div>
        </div>
   <%--<div class="feedback-container">
        <h2>We value your feedback!</h2>
        <form id="feedback-form">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="message">Message:</label>
                <textarea id="message" name="message" rows="4" required></textarea>
            </div>
            <button type="submit">Submit</button>
        </form>
        <div id="feedback-response"></div>
    </div>--%>
   
</asp:Content>
