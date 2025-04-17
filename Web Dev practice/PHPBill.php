<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <style>
      table{
        margin-left:80px;
        width: 90%;
        text-align:center;
        border-collapse: collapse;
        font-size:larger;
      }
      #orange{
        background-color:orange;
      }
      #yellow{
        background-color:yellow;
      }
      th{
        color:white;
      }
      #submit{
        margin:5px;
        height:30px; 
        width:80px;
      }
      tr{
        height:50px;
      }
      #ipBox{
        margin-top:20px;
        height:20px;
        width:200px;
      }
      p{
        margin-left: 100px;
        font-size:x-large;
        font-weight: bold;
        color:red;
      }
    </style>
  </head>
  <body>
    <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST">
      <table>
        <tr id="orange">
          <th colspan="2">
            <h2>ELECTRICITY BILL</h2>
          </th>
        </tr>  
        <tr id="yellow">
          <td>
            <label> Enter consumer number </label>
          </td>
          <td>
            <input type="text" name="c_no" id="ipBox"/><br /><br />
          </td>
        </tr>
        <tr>
          <td>
            <label> Enter consumer name</label>
          </td>
          <td>
            <input type="text" name="c_name" id="ipBox"/><br /><br />
          </td>
        </tr>
        <tr id="yellow">
          <td>
            <label> Enter previous reading</label>
          </td>
          <td>
            <input type="text" name="prev_r" id="ipBox"/><br /><br />
          </td>
        </tr>
        <tr>
          <td>
            <label> Enter present reading</label>
          </td>
          <td>
            <input type="text" name="present_r" id="ipBox"/><br /><br />
          </td>
        </tr>
        <tr id="orange">
          <td colspan="2">
            <input type="submit" value="Submit" id="submit"/>
          </td>
        </tr>
      </table>
    </form>
    <?php
      function test_fn($data) {
        $data = trim($data); // remove extra spaces, tabs, newlines
        $data = stripslashes($data); // remove backslashes
        $data = htmlspecialchars($data); // convert special chars like < > & etc.
        return $data;
      }

      if ($_SERVER['REQUEST_METHOD']=='POST') {
        $consumer_no=test_fn($_REQUEST['c_no']);
        $consumer_name=test_fn($_REQUEST['c_name']);
        $prev_reading=test_fn($_REQUEST['prev_r']);
        $present_reading=test_fn($_REQUEST['present_r']);
        if (empty($consumer_no)||empty($consumer_name)||empty($prev_reading)||empty($present_reading)) {
          echo "<br><p>* One of the fields is empty</p>";
        }
        else{
          if (!preg_match("/^[a-zA-z]+$/",$consumer_name)) {
            echo "<br><p>* Customer name should only contain alphabets</p>";
          }
          else if (!preg_match("/^[0-9]+$/",$prev_reading)) {
            echo "<br><p>* Previous reading should only contain numbers</p>";
          }
          else if (!preg_match("/^[0-9]+$/",$present_reading)) {
            echo "<br><p>* Present reading should only contain numbers</p>";
          }
          else{
            $unit=$present_reading-$prev_reading;
            $amount=$unit*4;
            
            echo "<br><br><table>";
            echo "<tr id='orange'><th colspan='2'><h2>ELECTRICITY BILL</h2></th></tr>";
            echo "<tr id='yellow'><td>Consumer number</td><td>$consumer_no</td></tr>";
            echo "<tr><td>Consumer name</td><td>$consumer_name</td></tr>";
            echo "<tr id='yellow'><td>Previous reading</td><td>$prev_reading</td></tr>";
            echo "<tr><td>Present reading</td><td>$present_reading</td></tr>";
            echo "<tr id='yellow'><td>Units consumed</td><td>$unit</td></tr>";
            echo "<tr><td>Amount</td><td>$amount</td></tr>";
            echo "</table>";
          }
        }
      }
    ?>
  </body>
</html>
