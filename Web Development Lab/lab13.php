<!DOCTYPE html>
<html>
    <head>
        <title>Swap Two Numbers</title>
    </head>
    <body>
        <h2>Enter Two Numbers to Swap</h2>
        <form method="post">
        Number 1: <input type="number" name="num1" required><br><br>
        Number 2: <input type="number" name="num2" required><br><br>
        <input type="submit" value="Swap">
        </form>
        <?php
            if ($_SERVER["REQUEST_METHOD"] == "POST") {
                $a = $_POST["num1"];
                $b = $_POST["num2"];
                echo "<h3>Before Swap: a = $a, b = $b</h3>";
                $temp = $a;
                $a = $b;
                $b = $temp;
                echo "<h3>After Swap: a = $a, b = $b</h3>";
            }
        ?>
    </body>
</html>