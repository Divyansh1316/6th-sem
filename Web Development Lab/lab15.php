<?php
    session_start();
    if (isset($_GET['logout'])) {   //$_GET used for URL links, $_POST used for form submission 
        session_destroy();
        header("Location: " . $_SERVER['PHP_SELF']);
        exit();
    }
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $username = $_POST["username"];
        $password = $_POST["password"];
        if ($username === "admin" && $password === "1234") {
            $_SESSION["user"] = $username;
        } else {
            $error = "Invalid credentials.";
        }
    }
?>
<!DOCTYPE html>
<html>
    <head>
     <title>PHP Login with Session</title>
    </head>
    <body>
        <?php if (isset($_SESSION["user"])): ?>
        <h2>Welcome, <?php echo $_SESSION["user"]; ?>!</h2>
        <p><a href="?logout=true">Logout</a></p>
        <?php else: ?>
        <h2>Login</h2>
        <form method="post">
            Username: <input type="text" name="username" required><br><br>
            Password: <input type="password" name="password" required><br><br>
            <input type="submit" value="Login">
        </form>
        <?php if (!empty($error)) echo "<p style='color:red;'>$error</p>"; ?>
        <?php endif; ?>
    </body>
</html>