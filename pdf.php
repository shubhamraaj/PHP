<?php
include'db.php';
session_start();
$type =$_GET ['type']??'pdf';
$result = $conn-> query("select * from products");
$pdf = new TCPDF();
$pdf->AddPage();
$html = '<h2>Products</h2>
<table border="1" cellpadding="2">
<tr>
<th><b>category</b></th>
<th><b>product_name</b></th>
<th><b>price</b></th>
<th><b>quantity</b></th>
<th><b>supplier_name</b></th>
</tr>';
while ($row = $result->fetch_assoc()){
$html.='<tr>
<td>'.$row['category'].'/<td>
<td>'.$row['product_name'].'/<td>
<td>'.$row['price'].'/<td>
<td>'.$row['quantity'].'/<td>
<td>'.$row['supplier_name'].'/<td>
</tr>';
}
$html.='</table>';
$pdf->writeHTML($html);
$pdf->Output('prducts.pdf', 'D');
?>