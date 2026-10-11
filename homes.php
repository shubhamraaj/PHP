<?php
session_start();
include 'db.php';

if (!isset($_SESSION['username'])) {
    header('Location: login.php');
}

if (isset($_POST['delete'])) {
    $id = $_POST['id'];
    $sql = $conn->prepare("DELETE FROM products WHERE id = ?");
    $sql->bind_param("i", $id);
    $sql->execute();
    header("Location: homes.php");
}

if (isset($_POST['add'])) {
    $name = $_POST['product_name'];
    $category = $_POST['category'];
    $price = $_POST['price'];
    $quantity = $_POST['quantity'];
    $supplier = $_POST['supplier_name'];

    $sql = $conn->prepare("INSERT INTO products (product_name, category, price, quantity, supplier_name) VALUES (?, ?, ?, ?, ?)");
    $sql->bind_param("sssis", $name, $category, $price, $quantity, $supplier);
    $sql->execute();
    header("Location: homes.php");
}

if (isset($_POST['update'])) {
    $id = $_POST['id'];
    $name = $_POST['product_name'];
    $category = $_POST['category'];
    $price = $_POST['price'];
    $quantity = $_POST['quantity'];
    $supplier = $_POST['supplier_name'];

    $sql = $conn->prepare("UPDATE products SET product_name = ?, category = ?, price = ?, quantity = ?, supplier_name = ? WHERE id = ?");
    $sql->bind_param("sssisi", $name, $category, $price, $quantity, $supplier, $id);
    $sql->execute();
    header("Location: homes.php");
}

if (isset($_GET['edit'])) {
    $id = (int) $_GET['edit'];
    $edit_result = $conn->query("SELECT * FROM products WHERE id = $id");
    if ($edit_result->num_rows > 0) {
        $edit_row = $edit_result->fetch_assoc();
    }
}

$result = $conn->query("SELECT * FROM products");
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Product Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <nav class="navbar navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="homes.php">Product Dashboard</a>
            <div>
                Hello, <?php echo $_SESSION['username']; ?>
                <a href="pdf.php" class="btn btn-success btn-sm ms-2">Generate PDF</a>
                <a href="Excel.php" class="btn btn-success btn-sm ms-2">Generate EXCEL</a>
                <a href="logout.php" class="btn btn-light btn-sm ms-2">Logout</a>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <h2>Product Inventory</h2>

        <form method="POST" class="card card-body mb-4">
            <h4>
                <?php
                if (isset($edit_row)) {
                    echo "Edit Product";
                } else {
                    echo "Add Product";
                }
                ?>
            </h4>

            <?php if (isset($edit_row)) { ?>
                <input type="hidden" name="id" value="<?php echo $edit_row['id']; ?>">
            <?php } ?>

            <label class="form-label">Product Name</label>
            <input type="text" name="product_name" class="form-control mb-3" value="<?php if (isset($edit_row)) echo $edit_row['product_name']; ?>" required>

            <label class="form-label">Category</label>
            <input type="text" name="category" class="form-control mb-3" value="<?php if (isset($edit_row)) echo $edit_row['category']; ?>" required>

            <label class="form-label">Price</label>
            <input type="number" name="price" class="form-control mb-3" step="0.01" value="<?php if (isset($edit_row)) echo $edit_row['price']; ?>" required>

            <label class="form-label">Quantity</label>
            <input type="number" name="quantity" class="form-control mb-3" value="<?php if (isset($edit_row)) echo $edit_row['quantity']; ?>" required>

            <label class="form-label">Description</label>
            <input type="text" name="supplier_name" class="form-control mb-3" value="<?php if (isset($edit_row)) echo $edit_row['supplier_name']; ?>" required>

            <?php if (isset($edit_row)) { ?>
                <button type="submit" name="update" class="btn btn-info">Update Product</button>
                <a href="homes.php" class="btn btn-secondary mt-2">Cancel</a>
            <?php } else { ?>
                <button type="submit" name="add" class="btn btn-info">Add Product</button>
            <?php } ?>
        </form>

        <div class="table-responsive">
            <table class="table table-bordered table-striped bg-white">
                <thead class="table-light">
                    <tr>
                        <th>ID</th>
                        <th>Product Name</th>
                        <th>Category</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Description</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <?php while ($row = $result->fetch_assoc()) { ?>
                        <tr>
                            <td><?php echo $row['id']; ?></td>
                            <td><?php echo $row['product_name']; ?></td>
                            <td><?php echo $row['category']; ?></td>
                            <td><?php echo $row['price']; ?></td>
                            <td><?php echo $row['quantity']; ?></td>
                            <td><?php echo $row['supplier_name']; ?></td>
                            <td><a href="homes.php?edit=<?php echo $row['id']; ?>" class="btn btn-success btn-sm">Edit</a></td>
                            <td>
                                <form method="POST" onsubmit="return confirm('Are you sure you want to delete this record?');">
                                    <input type="hidden" name="id" value="<?php echo $row['id']; ?>">
                                    <button type="submit" name="delete" class="btn btn-warning btn-sm">Delete</button>
                                </form>
                            </td>
                        </tr>
                    <?php } ?>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>