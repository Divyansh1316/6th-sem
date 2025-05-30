<!-- Objective: Write a PHP program to connect to a database and retrieve data from a
table and show the details in a neat format , a simple application to Enter data into
database, Develop a simple application to Update, Delete table data from database.
CODE: -->

<?php
// Database connection
$conn = new mysqli("localhost", "root", "", "web_practical", 3307);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
)";
if ($conn->query($sql) === TRUE) {
    echo "Table created successfully.";
} else {
    echo "Error creating table: " . $conn->error;
}

// Add new user
if (isset($_POST['add'])) {
    $name = $_POST['name'];
    $email = $_POST['email'];
    $conn->query("INSERT INTO users (name, email) VALUES ('$name', '$email')");
}

// Delete user
if (isset($_GET['delete'])) {
    $id = $_GET['delete'];
    $conn->query("DELETE FROM users WHERE id=$id");
}

// Update user
if (isset($_POST['update'])) {
    $id = $_POST['id'];
    $name = $_POST['name'];
    $email = $_POST['email'];
    $conn->query("UPDATE users SET name='$name', email='$email' WHERE id=$id");
}

// Fetch user data for editing
$edit = null;
if (isset($_GET['edit'])) {
    $id = $_GET['edit'];
    $result = $conn->query("SELECT * FROM users WHERE id=$id");
    $edit = $result->fetch_assoc();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Simple PHP CRUD</title>
</head>
<body>

<h2><?php echo $edit ? "Update User" : "Add User"; ?></h2>

<form method="post">
    <input type="hidden" name="id" value="<?php echo $edit['id'] ?? ''; ?>">
    Name: <input type="text" name="name" value="<?php echo $edit['name'] ?? ''; ?>" required><br><br>
    Email: <input type="email" name="email" value="<?php echo $edit['email'] ?? ''; ?>" required><br><br>
    <input type="submit" name="<?php echo $edit ? 'update' : 'add'; ?>" value="<?php echo $edit ? 'Update' : 'Add'; ?>">
</form>

<h2>User List</h2>

<table border="1">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Actions</th>
    </tr>
    <?php
    $result = $conn->query("SELECT * FROM users");
    while ($row = $result->fetch_assoc()) {
        echo "<tr>
                <td>{$row['id']}</td>
                <td>{$row['name']}</td>
                <td>{$row['email']}</td>
                <td>
                    <a href='?edit={$row['id']}'>Edit</a> |
                    <a href='?delete={$row['id']}'>Delete</a>
                </td>
              </tr>";
    }
    ?>
</table>

</body>
</html>
