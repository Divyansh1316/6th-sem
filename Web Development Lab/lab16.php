<!-- Objective: Write PHP program to implement a cookie and session-based
counter. Create Cookies variable using PHP, Display the cookies variable
using PHP.
CODE: -->
<?php
    session_start();
    if (isset($_SESSION['session_count'])) {
        $_SESSION['session_count']++;   //$_SESSION is read-write
    } else {
        $_SESSION['session_count'] = 1;
    }
    if (isset($_COOKIE['cookie_count'])) {
        $cookie_count = $_COOKIE['cookie_count'] + 1;   //$_COOKIE is read only so using a variable
    } else {
        $cookie_count = 1;
    }
    setcookie("cookie_count", $cookie_count, time() + 3600);
    setcookie("username", "JohnDoe", time() + 3600);
?>
<!DOCTYPE html>
<html>
    <head>
        <title>Cookie and Session Counter</title>
    </head>
    <body>
        <h2>Cookie and Session Based Counter</h2>
        <p><strong>Session Counter:</strong> <?php echo
        $_SESSION['session_count']; ?></p>
        <p><strong>Cookie Counter:</strong> <?php echo $cookie_count; ?></p>
        <h3>Custom Cookie Variable</h3>
        <p><strong>Username Cookie:</strong>
        <?php
            if (isset($_COOKIE['username'])) {
                echo $_COOKIE['username'];
            } else {
                echo "Cookie not set yet.";
            }
        ?>
        </p>
    </body>
</html>