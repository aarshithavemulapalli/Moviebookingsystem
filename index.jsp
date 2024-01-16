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
    <title>SilverScreener</title>
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
            margin: 0;
            font-size: 24px;
            margin-right: 10px;
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
            background-color: #fff; /* White background color */
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

        .book-button {
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

        .book-button:hover {
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
<body>
<header>
    <h1>
        🎬 SilverScreener
    </h1>
    <div id="searchContainer">
        <i id="searchIcon" class="fas fa-search"></i>
        <label for="searchBox"></label><input type="text" id="searchBox" placeholder="Search for movies...">
    </div>
    <button id="signInButton" onclick="location.href='http://localhost:8080/demo1_war_exploded/login.jsp';">SignIn</button>
    <button id="RegisterButton" onclick="location.href='http://localhost:8080/demo1_war_exploded/register.jsp';">Register</button>

</header>


<main>
    <!-- Existing Movie Cards -->

    <!-- Recommended Movie Card 1 -->
    <div class="movie action">
        <img src="nepolean.jpg" alt="Movie Poster">
        <div class="movie-content">
            <h1>Recommended Action Movie</h1>
            <p>Description of the action movie. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
            <a href="http://localhost:8080/demo1_war_exploded/theatreSelection.jsp" class="book-button">Book Ticket</a>
        </div>
    </div>

    <!-- Recommended Movie Card 2 -->
    <div class="movie comedy">
        <img src="Marvels.jpeg" alt="Movie Poster">
        <div class="movie-content">
            <h2>Recommended Comedy Movie</h2>
            <p>Description of the comedy movie. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
            <a href="http://localhost:8080/demo1_war_exploded/theatreSelection.jsp" class="book-button">Book Ticket</a>
        </div>
    </div>

    <!-- Recommended Movie Card 3 -->
    <div class="movie comedy">
        <img src="wish.jpeg" alt="Movie Poster">
        <div class="movie-content">
            <h3>Recommended Comedy Movie</h3>
            <p>Description of the comedy movie. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
            <a href="http://localhost:8080/demo1_war_exploded/theatreSelection.jsp" class="book-button">Book Ticket</a>
        </div>
    </div>

    <!-- Recommended Movie Card 4 -->
    <div class="movie comedy">
        <img src="Thanksgiving.jpeg" alt="Movie Poster">
        <div class="movie-content">
            <h4>Recommended Comedy Movie</h4>
            <p>Description of the comedy movie. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
            <a href="http://localhost:8080/demo1_war_exploded/theatreSelection.jsp" class="book-button">Book Ticket</a>
        </div>
    </div>

    <!-- Recommended Movie Card 5 -->
    <div class="movie comedy">
        <img src="Holdovers.jpeg" alt="Movie Poster">
        <div class="movie-content">
            <h5>Recommended Comedy Movie</h5>
            <p>Description of the comedy movie. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
            <a href="http://localhost:8080/demo1_war_exploded/theatreSelection.jsp" class="book-button">Book Ticket</a>
        </div>
    </div>

    <!-- Add more recommended movie cards as needed -->

</main>

<script>
    const menuButton = document.getElementById('menuButton');
    const menuDropdown = document.getElementById('menuDropdown');

    menuButton.addEventListener('click', () => {
        menuDropdown.style.display = menuDropdown.style.display === 'block' ? 'none' : 'block';
    });

    document.addEventListener('click', (event) => {
        if (!event.target.matches('#menuButton') && !event.target.matches('.menuOption')) {
            menuDropdown.style.display = 'none';
        }
    });

    // Function to filter movies by category
    function filterMoviesByCategory(category) {
        const allMovies = document.querySelectorAll('.movie');
        const hollywoodSection = document.getElementById('hollywoodSection');

        if (category === 'hollywood') {
            allMovies.forEach((movie) => {
                movie.style.display = 'none';
            });
            hollywoodSection.style.display = 'flex';
        } else {
            hollywoodSection.style.display = 'none';

            allMovies.forEach((movie) => {
                if (category === 'all' || movie.classList.contains(category)) {
                    movie.style.display = 'block';
                } else {
                    movie.style.display = 'none';
                }
            });
        }
    }
</script>
</body>
</html>