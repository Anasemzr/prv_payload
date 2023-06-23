<?php

// Database credentials
$servername = "db4free.net";
$username = "pokedex";
$password = "SAE_pokedex";
$dbname = "pokedex_user";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// SQL query
$sql = "SELECT identifiant, passwd FROM user";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Array to store the data
    $data = array();

    // Fetch data from the result set
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }

    // Convert data to JSON
    $json = json_encode($data);

    // Output JSON
    echo $json;
} else {
    echo "No data found";
}

// Close connection
$conn->close();

?>
