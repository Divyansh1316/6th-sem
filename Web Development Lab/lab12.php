<?php
    //odd or even
    $num=7;
    if ($num%2==0) {
        echo "$num is even";
    }
    else{
        echo "$num is odd";
    }

    //max of 3 numbers
    $num1=10;
    $num2=20;
    $num3=30;

    // $max=max($num1,$num2,$num3);

    $max=$num1;
    if ($num2>$max) {
        $max=$num2;
    }
    if ($num3>$max) {
        $max=$num3;
    }
    echo "<br> Max is $max"
?>