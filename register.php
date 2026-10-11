<?php
include 'db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = $_POST['name'];
    $email = $_POST['email'];
    $phone = (int) $_POST['phone'];
    $city = $_POST['city'];
    $password = password_hash($_POST['password'], PASSWORD_BCRYPT);

    $sql = $conn->prepare("INSERT INTO users (name, email, password, phone, city) VALUES (?, ?, ?, ?, ?)");
    $sql->bind_param("sssis", $name, $email, $password, $phone, $city);

    if ($sql->execute()) {
        header("Location: homes.php");
        exit;
    } else {
        $message = "Registration failed. Please try again.";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-7">
                <div class="card shadow border-0">
                    <div class="card-body p-4">
                        <h2 class="text-center mb-4">Registration</h2>
                        
                        <form method="POST">
                            <div class="mb-3">
                                <label class="form-label">Name/Username</label>
                                <input type="text" name="name" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Email</label>
                                <input type="email" name="email" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Password</label>
                                <input type="password" name="password" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Phone Number</label>
                                <input type="number" name="phone" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">City</label>
                                <input type="text" name="city" class="form-control" required>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Register</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>