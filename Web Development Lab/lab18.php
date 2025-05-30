<!-- File Handling Using PHP: Write a php program to Read from existing file.,
Write a php program to Write a file.

CODE:

/* readfile.php */ -->

<?php
$filename = "example.txt";
if (file_exists($filename)) {
    $file = fopen($filename, "r");
    $content = fread($file, filesize($filename));
    echo "<h3>Content of the file:</h3>";
    echo nl2br($content); 
    fclose($file);
} else {
    echo "The file does not exist.";
}
?>

<!-- /* writefile.php*/ -->

<?php
$filename = "example.txt";

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['content'])) {
    $content = $_POST['content'];
    $file = fopen($filename, "w");

    if ($file) {
        fwrite($file, $content);
        fclose($file);
        $message = "Data has been written successfully into '$filename'.";
    } else {
        $message = "Error: Could not open file for writing.";
    }
}
?>

<!DOCTYPE html>
<html>
    <head>
        <title>File Writer</title>
    </head>
    <body>
        <h2>Write to File</h2>
    
        <?php if (isset($message)): ?>
        <p style="color: green;"><?php echo $message; ?></p>
        <?php endif; ?>
    
        <form method="POST">
            <textarea name="content" rows="5" cols="50" placeholder="Enter your content here..."></textarea><br>
            <button type="submit">Write to File</button>
        </form>

        <hr>
    </body>
</html>