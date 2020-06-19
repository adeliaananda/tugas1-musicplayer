<h2>DATA Play

</h2>

<?php 
include "app/Controller.php";
include "app/Played.php";


$alb = new App\Played();
$rows = $alb->tampil();

?>

<table>
	<tr>
		<th>NO</th>
		<th>NAMA</th>
		<th>Tanggal</th>
	</tr>
	<?php $no=0; foreach ($rows as $row) { $no++;?>
		<tr>
			<td><?php echo $no; ?></td>
			<td><?php echo $row['track_name']; ?></td>
			<td><?php echo $row['play_date']; ?></td>
			</tr>
	<?php } ?>
</table>