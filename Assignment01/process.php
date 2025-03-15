<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = htmlspecialchars($_POST['name']);
    $email = htmlspecialchars($_POST['email']);
    $password = htmlspecialchars($_POST['password']);
    $confirm_password = htmlspecialchars($_POST['confirm_password']);

    if (empty($name)) {
        echo "<p><strong>Name: Cannot be empty</strong></p>";
    } else if (empty($email)) {
        echo "<p><strong>Email: Must be a valid email address</strong></p>";
    } elseif ($password !== $confirm_password) {
        echo "<p><strong>Password: Must match</strong></p>";
    } else {
        echo "<h2>Form Submitted Successfully!</h2>";
        echo "<p><strong>Name:</strong> $name</p>";
        echo "<p><strong>Email:</strong> $email</p>";
        echo "<p><strong>Password:</strong> $password</p>";
    }
}
?>