<?php
session_start();

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $data = json_decode(file_get_contents("php://input"), true);

    if (!isset($data["action"])) {
        echo json_encode(["error" => "Invalid request"]);
        exit;
    }

    if ($data["action"] === "add" && isset($data["name"], $data["age"])) {
        $_SESSION["students"][] = ["name" => $data["name"], "age" => $data["age"]];
    } 
    elseif ($data["action"] === "edit" && isset($data["name"], $data["age"], $data["studentId"])) {
        $studentId = (int)$data["studentId"];
        if (isset($_SESSION["students"][$studentId])) {
            $_SESSION["students"][$studentId] = ["name" => $data["name"], "age" => $data["age"]];
        }
    } 
    elseif ($data["action"] === "delete" && isset($data["index"])) {
        $index = (int)$data["index"];
        if (isset($_SESSION["students"][$index])) {
            array_splice($_SESSION["students"], $index, 1);
        }
    } 
    else {
        echo json_encode(["error" => "Invalid action"]);
        exit;
    }
}

if (isset($_GET["action"]) && $_GET["action"] === "get" && !isset($_GET["index"])) {
    echo json_encode($_SESSION["students"]);
    exit;
}

if (isset($_GET["action"]) && $_GET["action"] === "get" && isset($_GET["index"])) {
    $index = (int)$_GET["index"];
    if (isset($_SESSION["students"][$index])) {
        echo json_encode($_SESSION["students"][$index]);
        exit;
    } else {
        echo json_encode(["error" => "Student not found"]);
        exit;
    }
}

echo json_encode(["error"]);
exit;
?>