<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Payment</title>
  <style>
    body {
      font-family: 'Arial', sans-serif;
      margin: 0;
      padding: 20px;
      display: flex;
      flex-direction: column;
      align-items: center;
    }

    .payment-container {
      width: 50%;
      border: 2px solid #ddd;
      border-radius: 10px;
      padding: 20px;
      margin-bottom: 20px;
    }

    .details-container {
      display: flex;
      justify-content: space-between;
      margin-bottom: 20px;
    }

    .left-details {
      flex: 1;
    }

    .right-details {
      flex: 1;
      text-align: right;
    }

    .card-details {
      margin-top: 20px;
    }

    input {
      padding: 10px;
      margin-bottom: 10px;
      width: 100%;
      box-sizing: border-box;
    }

    .input-label {
      margin-bottom: 5px;
    }

    #agreeLabel {
      display: flex;
      align-items: center;
      justify-content: flex-start;
      margin-bottom: 10px;
    }

    #agreeCheckbox {
      margin-right: 5px; /* Adjust the margin as needed */
      justify-content: flex-start;
    }

    .buttons-container {
      display: flex;
      justify-content: space-between;
    }

    button {
      padding: 15px;
      font-size: 16px;
      cursor: pointer;
      border-radius: 4px;
    }

    #submitBtn {
      background-color: #4CAF50;
      color: white;
      border: none;
    }

    #cancelBtn {
      background-color: #f44336;
      color: white;
      border: none;
    }

    .error-message {
      color: #f00;
      font-size: 14px;
      margin-top: 10px;
    }
  </style>
</head>
<body>

<div class="payment-container">
  <div class="details-container">
    <div class="left-details">
      <p><% String firstName = (String) session.getAttribute("firstName");
        out.println(firstName); %></p>
      <p>Seat Number: </p>
      <p>Date: <span id="currentDate"></span></p>
      <p>Time: <span id="currentTime"></span></p>

      <script>
        function updateDateTime() {
          const now = new Date();

          const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
          const formattedDate = now.toLocaleDateString('en-US', options);

          const formattedTime = now.toLocaleTimeString('en-US');

          document.getElementById('currentDate').innerText = formattedDate;
          document.getElementById('currentTime').innerText = formattedTime;
        }

        // Call the function when the page loads
        window.onload = function() {
          updateDateTime();
        };
      </script>
    </div>
    <%
      String totalPrice = request.getParameter("totalPrice");
    %>
    <div class="right-details">
      <p>Total Cost: $<%= totalPrice %></p>
    </div>


    <div class="card-details">
    <h2>Enter Card Details</h2>
    <label for="cardNumber" class="input-label">Card Number *</label>
    <input type="text" id="cardNumber" placeholder="Enter card number">

    <label for="expirationDate" class="input-label">Expiration Date *</label>
    <input type="text" id="expirationDate" placeholder="MM/YYYY">

    <label for="cvv" class="input-label">CVV *</label>
    <input type="text" id="cvv" placeholder="Enter CVV">

    <label for="cardholderName" class="input-label">Cardholder Name *</label>
    <input type="text" id="cardholderName" placeholder="Enter cardholder name">
  </div>

  <label for="agreeCheckbox" id="agreeLabel">
    <input type="checkbox" id="agreeCheckbox"> I agree to the terms and conditions
  </label>

  <div class="buttons-container">
    <button id="submitBtn" onclick="submitForm()">Submit</button>
    <button id="cancelBtn">Cancel</button>
  </div>

  <div id="errorMessage" class="error-message"></div>
</div>

<script>
  function submitForm() {
    const cardNumber = document.getElementById('cardNumber').value;
    const expirationDate = document.getElementById('expirationDate').value;
    const cvv = document.getElementById('cvv').value;
    const cardholderName = document.getElementById('cardholderName').value;
    const agreeCheckbox = document.getElementById('agreeCheckbox').checked;

    // Check if card details are filled and the user has agreed to terms
    if (cardNumber && expirationDate && cvv && cardholderName && agreeCheckbox) {
      // Simulated submission logic (replace with your actual logic)
      alert('Booking successful!');
      // Redirect to booking success page

      window.location.href = 'http://localhost:8080/demo1_war_exploded/bookingsuccess.jsp';
    } else {
      document.getElementById('errorMessage').innerText = 'Payment unsuccessful. Please fill in all the required fields and agree to the terms.';
    }
  }
</script>

</body>
</html>
