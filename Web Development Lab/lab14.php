<?php
    $var = 10;
    echo "Initial type of var: " . gettype($var) . "<br>";
    settype($var, "string");
    echo "After settype(), type of var: " . gettype($var) . "<br>";
    $name = "John";
    if (isset($name)) {
        echo "\$name is set and not null.<br>";
    } else {
        echo "\$name is not set or is null.<br>";
    }
    unset($name);
    if (isset($name)) {
        echo "\$name is still set.<br>";
    } else {
        echo "\$name is not set.<br>";
    }
    echo "Type of var after unset: " . gettype($name) . "<br>";
?>