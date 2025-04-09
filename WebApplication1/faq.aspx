<%@ Page Title="" Language="C#" MasterPageFile="~/navfooter.Master" AutoEventWireup="true" CodeBehind="faq.aspx.cs" Inherits="WebApplication1.faq" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        /* General Styles */

        .container-fluid {
            display: flex;
            justify-content: space-between;
            max-width: 100%; /* Set to full width */
            margin: 40px auto;
            padding: 20px;
            gap: 40px;
        }

        /* FAQ Section */
        .faq-section {
            flex: 1 1 50%;
            max-width: 700px;
        }

        .faq-section h2 {
            font-size: 28px;
            color: #2d3a45;
            margin-bottom: 10px;
        }

        .subheading {
            color: #707070;
            font-size: 16px;
            margin-bottom: 20px;
        }

        .faq-item {
            margin-bottom: 15px;
            background: #ffffff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: box-shadow 0.3s;
        }

        .faq-item:hover {
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
        }

        .faq-question {
            width: 100%;
            padding: 15px 20px;
            font-size: 18px;
            font-weight: 600;
            color: #2d3a45;
            background: #ffffff;
            border: none;
            cursor: pointer;
            display: flex;
            justify-content: space-between;
            align-items: center;
            transition: background 0.3s, color 0.3s;
        }

        .faq-question:hover {
            background: #f0f2f5;
        }

        .toggle-icon {
            font-size: 24px;
            color: #2d3a45;
            transition: transform 0.3s;
        }

        .faq-answer {
            display: none;
            padding: 15px 20px;
            font-size: 16px;
            color: #555;
            background-color: #f9f9f9;
            border-top: 1px solid #eee;
            animation: fadeIn 0.3s ease-in-out;
        }

        /* Animation for fade-in effect */
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        /* Video Section */
        .video-section {
            margin-left: 60px;
            flex: 1;
            padding: 20px;
            background-color: #f5f5f5;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .video-section:hover {
            transform: scale(1.02);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
        }

        .video-section h3 {
            font-size: 22px;
            color: #2d3a45;
            margin-bottom: 15px;
        }

       video {
    margin-top: -40px; /* Move video slightly upward */
    width: 100%;
    height: 500px; /* Increase video height */
    border-radius: 8px;
}

        /* FAQ Opened Style */
        .faq-item.active .faq-answer {
            display: block;
        }

        .faq-item.active .toggle-icon {
            transform: rotate(45deg);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container-fluid {
                flex-direction: column;
                align-items: center;
            }

            .faq-section, .video-section {
                max-width: 100%;
                flex: 1 1 100%;
                margin-left: 0;
            }
        }
    </style>

    <div class="container-fluid">
        <!-- FAQ Section -->
    <div class="faq-section">
    <h2>FAQs</h2>
    <p class="subheading">Answers to your most common questions about online doctor appointments for skin and laser treatments.</p>

    <!-- FAQ Items -->
    <div class="faq-item">
        <button type="button" class="faq-question">What is an online consultation with a skin and laser specialist? <span class="toggle-icon">+</span></button>
        <div class="faq-answer">
            <p>An online consultation with a skin and laser specialist allows you to book a virtual appointment to discuss your skin concerns and treatment options. This consultation is convenient and can be done from the comfort of your home via video call or chat.</p>
        </div>
    </div>

    <div class="faq-item">
        <button type="button" class="faq-question">How do I book an appointment? <span class="toggle-icon">+</span></button>
        <div class="faq-answer">
            <p>You can easily book an appointment by filling out the appointment form on our website. Provide your details such as name, contact information, and preferred date and time, and our team will confirm your appointment.</p>
        </div>
    </div>

    <div class="faq-item">
        <button type="button" class="faq-question">What skin treatments are available through online consultations? <span class="toggle-icon">+</span></button>
        <div class="faq-answer">
            <p>During your online consultation, our skin and laser specialist will discuss various treatment options such as acne treatments, laser skin resurfacing, pigmentation correction, anti-aging treatments, and more based on your specific skin concerns.</p>
        </div>
    </div>

    <div class="faq-item">
        <button type="button" class="faq-question">Do I need to prepare anything before my online consultation? <span class="toggle-icon">+</span></button>
        <div class="faq-answer">
            <p>It is recommended that you have a clear view of your skin, preferably without makeup, so the doctor can assess your skin condition. You should also have your medical history available in case the specialist asks for it.</p>
        </div>
    </div>

    <div class="faq-item">
        <button type="button" class="faq-question">How long does an online consultation last? <span class="toggle-icon">+</span></button>
        <div class="faq-answer">
            <p>An online consultation typically lasts between 15 to 30 minutes, depending on the complexity of your concerns and the treatments discussed.</p>
        </div>
    </div>


    
</div>


        <!-- Video Section -->
        <div class="video-section">
            <h3>How to book an Appointment?</h3>
            <video controls poster="img/1availablefeature.jpg">
                <source src="img/video2.mp4" type="video/mp4">
                Your browser does not support the video tag.
            </video>
        </div>
        </div>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const faqButtons = document.querySelectorAll('.faq-question');

            faqButtons.forEach(button => {
                button.addEventListener('click', () => {
                    const faqItem = button.parentElement;
                    faqItem.classList.toggle('active');
                    const icon = button.querySelector('.toggle-icon');
                    icon.textContent = faqItem.classList.contains('active') ? '-' : '+';
                });
            });
        });
    </script>
</asp:Content>
