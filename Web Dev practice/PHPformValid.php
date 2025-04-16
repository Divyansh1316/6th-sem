<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
  </head>
  <body>
    <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST">
      <label> First Name </label>
      <input type="text" name="f_n"/><br /><br />
      <label> Last Name</label>
      <input type="text" name="l_n"/><br /><br />
      <input type="submit" value="submit" />
    </form>
    <?php
      function test_fn($data) {
        $data = trim($data); // remove extra spaces, tabs, newlines
        $data = stripslashes($data); // remove backslashes
        $data = htmlspecialchars($data); // convert special chars like < > & etc.
        return $data;
      }

      if ($_SERVER['REQUEST_METHOD']=='POST') {
        $first_name=test_fn($_REQUEST['f_n']);
        $last_name=test_fn($_REQUEST['l_n']);
        if (empty($first_name) || empty($last_name)) {
          echo "<br>One of the fields is empty";
        }
        if (strlen($first_name)<5 || strlen($last_name)<5) {
          echo "Either First name or last name less than 5 characters";
        }
        if (!preg_match("/^[a-zA-Z]+$/",$first_name)) {
          echo "First name should contain only letters.";
        }
        else
        {
          echo "<br>First name : " . $first_name;
          echo "<br>Last name : " . $last_name;
        }
      }
    ?>
  </body>
</html>
