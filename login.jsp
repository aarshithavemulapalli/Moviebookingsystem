<%--
  Created by IntelliJ IDEA.
  User: sai
  Date: 11/25/23
  Time: 8:52 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
        body {
            background-color: #f8f8f8; /* Light background color */
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        form {
            background-color: #ffffff; /* White background color */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
        }

        h1 {
            color: #4caf50; /* Green color for "Login" text */
            text-align: center;
        }

        label {
            display: block;
            margin-bottom: 8px;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 16px;
            box-sizing: border-box;
        }

        button {
            background-color: #4caf50;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }

        button:hover {
            background-color: #45a049;
        }

        /* Asterisk for required fields */
        .required::before {
            content: "* ";
            color: red;
        }

        /* Forgot password link */
        .forgot-password {
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<form action="${pageContext.request.contextPath}/login" method="post">
    <h1>Login</h1>
    <label for="username" class="required">Username:</label>
    <input type="text" id="username" name="username" required>

    <label for="password" class="required">Password:</label>
    <input type="password" id="password" name="password" required>

    <button type="submit">Login</button>

    <!-- Forgot password link -->
    <div class="forgot-password">
        <a href="#">Forgot Password?</a>
    </div>
</form>
</body>
</html>