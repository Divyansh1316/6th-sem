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
      #ipBox{
        margin-top:20px;
        height:20px;
        width:200px;
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
        
        $unit=$present_reading-$prev_reading;
        $amount=$unit*4;
        
        echo "Consumer number ".$consumer_no."<br>";
        echo "Consumer name ".$consumer_name."<br>";
        echo "Previous reading ".$prev_reading."<br>";
        echo "Present reading ".$present_reading."<br>";

        echo "Units consumed ".$unit."<br>";
        echo "Amount ".$amount."<br>";
      }
    ?>
  </body>
</html>
