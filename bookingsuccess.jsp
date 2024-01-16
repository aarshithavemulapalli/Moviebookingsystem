<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Booking Successful</title>
  <style>
    body {
      font-family: 'Arial', sans-serif;
      margin: 0;
      padding: 20px;
      display: flex;
      flex-direction: column;
      align-items: center;
    }

    .success-container {
      width: 50%;
      border: 2px solid #4CAF50;
      border-radius: 10px;
      padding: 20px;
      margin-bottom: 20px;
      text-align: center;
    }

    .success-message {
      color: #4CAF50;
      font-size: 24px;
      font-weight: bold;
    }

    .buttons-container {
      display: flex;
      justify-content: center;
      margin-top: 20px;
    }

    button {
      padding: 15px;
      font-size: 16px;
      cursor: pointer;
      border-radius: 4px;
    }

    #backBtn {
      background-color: #4CAF50;
      color: white;
      border: none;
    }
  </style>
</head>
<body>

<div class="success-container">
  <div class="success-message">Booking Successful <span>&#10004;</span></div>

  <div class="buttons-container">
    <button id="backBtn" onclick="goBack()">Back to Movies</button>
  </div>
</div>

<script>
  function goBack() {
    // Redirect back to index.jsp
    window.location.href = 'http://localhost:8080/demo1_war_exploded/UserHome.jsp';
  }
</script>

</body>
</html>
