<%--
  Created by IntelliJ IDEA.
  User: sai
  Date: 11/27/23
  Time: 12:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>BookMyShow</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <style>
    body {
      font-family: 'Arial', sans-serif;
      margin: 0;
      padding: 0;
      display: flex;
      flex-direction: column;
      align-items: center;
      background-color: #f8f8f8f2; /* Light background color */
    }

    header {
      background-color: #4caf50; /* BookMyShow Pink */
      color: #fff;
      padding: 10px;
      text-align: left;
      width: 100%;
      box-sizing: border-box;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    h1,h2,h3,h4,h5 {
      font-size: 24px;
      margin: 0 10px 0 0;
      display: flex;
      align-items: center;
    }

    #searchContainer {
      display: flex;
      align-items: center;
      flex-grow: 1; /* Take remaining space in the header */
    }

    #searchIcon {
      font-size: 20px;
      color: #fff;
      margin-right: 5px;
    }

    #searchBox {
      padding: 8px;
      border: none;
      border-radius: 4px;
      width: 80%; /* Reduced width of the search box */
    }

    #signInButton,
    #registerButton {
      background-color: #fff; /* White background color */
      color: #4caf50; /* BookMyShow Pink */
      padding: 8px 12px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }

    #registerButton {
      margin-left: 5px;
    }

    #menuButton {
      background-color: transparent;
      border: none;
      cursor: pointer;
      font-size: 20px;
      color: #fff;
    }

    #menuDropdown {
      display: none;
      position: absolute;
      top: 40px;
      right: 0;
      background-color: #fff; /* White background color */
      box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
      z-index: 1;
    }

    .menuOption {
      padding: 10px;
      color: #4caf50; /* BookMyShow Pink */
      text-decoration: none;
      display: block;
    }

    .menuOption:hover {
      background-color: #f0f0f0; /* Light gray background on hover */
    }

    main {
      display: flex;
      flex-wrap: wrap;
      justify-content: space-around;
      padding: 20px;
      width: 100%;
      box-sizing: border-box;
    }

    .movie {
      background-color: #fff;
      border-radius: 8px;
      margin: 20px;
      overflow: hidden;
      width: 300px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      transition: transform 0.3s ease-in-out;
    }


    .movie:hover {
      transform: scale(1.05);
    }

    .movie img {
      width: 100%;
      height: 200px; /* Set the desired height for all images */
      object-fit: cover; /* Maintain aspect ratio and cover the entire container */
      border-radius: 8px 8px 0 0;
    }

    .movie-content {
      padding: 16px;
    }

    .movie h1,h2,h3,h4,h5 {
      color: #4caf50; /* BookMyShow Pink */
      margin-bottom: 8px;
      font-size: 18px;
    }

    .movie p {
      color: #333; /* Dark text color */
      margin-bottom: 16px;
      font-size: 14px;
    }

    .find-seat {
      background-color: #4caf50; /* BookMyShow Pink */
      color: #fff;
      padding: 10px 20px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-size: 16px;
      display: block;
      width: 100%;
      text-align: center;
      text-decoration: none;
    }

    .find-seat:hover {
      background-color: #4caf50; /* Slightly darker pink on hover */
    }

    .icons {
      text-align: right;
      margin-top: 20px;
    }

    .icons i {
      font-size: 36px;
      margin: 10px;
      color: #4caf50; /* BookMyShow Pink */
      cursor: pointer;
    }

    /* Additional styles for Hollywood movies section */
    #hollywoodSection{
      display: none;
      flex-wrap: wrap;
      justify-content: space-around;
      padding: 20px;
      width: 100%;
      box-sizing: border-box;
    }

    .hollywoodMovie{
      background-color: #fff; /* White background color */
      border-radius: 8px;
      margin: 20px;
      overflow: hidden;
      width: 300px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      transition: transform 0.3s ease-in-out;
    }

    .hollywoodMovie:hover{
      transform: scale(1.05);
    }

    .hollywoodMovie img{
      width: 100%;
      border-radius: 8px 8px 0 0;
    }

    .hollywoodMovie-content{
      padding: 16px;
    }

    .hollywoodMovie h2{
      color: #4caf50; /* BookMyShow Pink */
      margin-bottom: 8px;
      font-size: 18px;
    }

    .hollywoodMovie h2{
      color: #4caf50; /* BookMyShow Pink */
      margin-bottom: 8px;
      font-size: 18px;
    }

    .hollywoodMovie p{
      color: #333; /* Dark text color */
      margin-bottom: 16px;
      font-size: 14px;
    }

    .hollywoodMovieRating{
      color: #4caf50; /* BookMyShow Pink */
      font-size: 16px;
    }

    /* Additional styles for categories */
    #categories {
      display: flex;
      justify-content: space-around;
      margin-top: 20px;
    }

    .category {
      cursor: pointer;
      padding: 10px;
      background-color: #4caf50; /* BookMyShow Pink */
      color: #fff;
      border-radius: 4px;
    }

    .category:hover {
      background-color: #4caf50; /* Slightly darker pink on hover */
    }
  </style>
</head>


<main>
  <!-- Recommended Movie Card 1 -->
  <div id="3" class="movie action">
    <img src="university.jpeg" alt="Movie Poster">
    <div class="movie-content">
      <h1>University 16 Cinemas</h1>
      <p>📍Athens</p>
      <a href="http://localhost:8080/demo1_war_exploded/popup.jsp" class="find-seat">Find Seat</a>
    </div>
  </div>

  <!-- Recommended Movie Card 2 -->
  <div id="2" class="movie comedy">
    <img src="Beachwood.jpeg" alt="Movie Poster">
    <div class="movie-content">
      <h2>Beechwood Cinemas</h2>
      <p>📍Athens</p>
      <a href="http://localhost:8080/demo1_war_exploded/popup.jsp" class="find-seat">Find Seat</a>
    </div>
  </div>

  <!-- Recommended Movie Card 3 -->
  <div id="4" class="movie comedy">
    <img src="Cine.jpeg" alt="Movie Poster">
    <div class="movie-content">
      <h3>Ciné</h3>
      <p>📍Athens</p>
      <a href="http://localhost:8080/demo1_war_exploded/popup.jsp" class="find-seat">Find Seat</a>
    </div>
  </div>

  <!-- Recommended Movie Card 4 -->
  <div id = "1" class="movie comedy">
    <img src="B&B.jpeg" alt="Movie Poster">
    <div class="movie-content">
      <h4>B&B Theatres Athens 12</h4>
      <p>📍Athens</p>
      <a href="http://localhost:8080/demo1_war_exploded/popup.jsp" class="find-seat">Find Seat</a>
    </div>
  </div>


</main>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
function bookTicket(N) {
// Use AJAX to send the div id to the servlet
$.ajax({
type: 'POST',
url: '/booking', // Replace with your servlet URL
data: {divId: N},
success: function (response) {
// Handle the response from the servlet (if needed)
//console.log('Data sent successfully:', response);
// Redirect to the theatreSelection.jsp page or handle the response as needed
window.location.href = 'http://localhost:8080/demo1_war_exploded/theatreSelection.jsp';
},
error: function (error) {
console.error('Error sending data:', error);
}
});
}
</script>
</html>






