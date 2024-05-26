<?php
// รับข้อมูลที่ส่งมาจาก Lua
$jsonData = file_get_contents('php://input');
$data = json_decode($jsonData, true);

// เชื่อมต่อกับฐานข้อมูล SQL
$servername = "localhost";
$username = "id21941414_nopchillz";
$password = "@Nongnop001";
$dbname = "id21941414_bf_data";

// สร้างการเชื่อมต่อ
$conn = new mysqli($servername, $username, $password, $dbname);

// ตรวจสอบการเชื่อมต่อ
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// ตรวจสอบว่ามีข้อมูล JSON ที่ถูกต้องถูกส่งมาหรือไม่
if ($data !== null) {
    // ตรวจสอบว่ามีข้อมูลในอาร์เรย์หรือไม่ก่อนเข้าถึง
    if (isset($data["player"]) && isset($data["level"]) && isset($data["money"]) && isset($data["world"]) && isset($data["mirror"]) && isset($data["valk"]) && isset($data["fruit_awaken"]) && isset($data["fruit_inventory"]) && isset($data["race"]) && isset($data["tier"]) && isset($data["melee"]) && isset($data["fragment"]) && isset($data["bounty"]) && isset($data["lever"]) && isset($data["type"]) && isset($data["name"])) {
        $player = $conn->real_escape_string($data["player"]);
        $level = $conn->real_escape_string($data["level"]);
        $money = $conn->real_escape_string($data["money"]);
        $world = $conn->real_escape_string($data["world"]);
        $mirror = $conn->real_escape_string($data["mirror"]);
        $valk = $conn->real_escape_string($data["valk"]);
        $fruit_awaken = $conn->real_escape_string($data["fruit_awaken"]);
        $fruit_inventory = $conn->real_escape_string($data["fruit_inventory"]);
        $race = $conn->real_escape_string($data["race"]);
        $tier = $conn->real_escape_string($data["tier"]);
        $melee = $conn->real_escape_string($data["melee"]);
        $fragment = $conn->real_escape_string($data["fragment"]);
        $bounty = $conn->real_escape_string($data["bounty"]);
        $lever = $conn->real_escape_string($data["lever"]);
        $type = $conn->real_escape_string($data["type"]);
        $name = $conn->real_escape_string($data["name"]);

        // ตรวจสอบว่ามีข้อมูลของผู้เล่นอยู่ในฐานข้อมูลหรือไม่
        $checkPlayerQuery = "SELECT * FROM user_data WHERE username = '$player'";
        $checkPlayerResult = $conn->query($checkPlayerQuery);

        if ($checkPlayerResult->num_rows > 0) {
            // ถ้ามีข้อมูลของผู้เล่นอยู่ในฐานข้อมูลแล้ว ให้ทำการอัปเดต level และ money
            $updateQuery = "UPDATE user_data SET level = '$level', money = '$money', world = '$world', mirror = '$mirror', valk = '$valk', fruit_awaken = '$fruit_awaken', fruit_inventory = '$fruit_inventory', race = '$race', tier = '$tier', melee = '$melee', fragment = '$fragment', bounty = '$bounty', lever = '$lever', type = '$type', name = '$name' WHERE username = '$player'";
            if ($conn->query($updateQuery) === TRUE) {
                echo "Data updated successfully";
            } else {
                echo "Error updating record: " . $conn->error;
            }
        } else {
            // ถ้ายังไม่มีข้อมูลของผู้เล่นในฐานข้อมูล ให้ทำการเพิ่มข้อมูลใหม่
            $insertQuery = "INSERT INTO user_data (username, level, money, world, mirror, valk, fruit_awaken, fruit_inventory, race, tier, melee, fragment, bounty, lever, type, name) VALUES ('$player', '$level', '$money', '$world', '$mirror', '$valk', '$fruit_awaken', '$fruit_inventory', '$race', '$tier', '$melee', '$fragment', '$bounty', '$lever', '$type', '$name')";
            if ($conn->query($insertQuery) === TRUE) {
                echo "New record created successfully";
            } else {
                echo "Error: " . $insertQuery . "<br>" . $conn->error;
            }
        }
    } else {
        echo "Error: Missing required data";
    }
} else {
    echo "Error: No data received";
}

$conn->close();
?>
