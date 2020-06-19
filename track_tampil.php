<h2>DATA LAGU
	<a href="dashboard.php?page=track_input" class="btn">Tambah</a>
</h2>

<?php 
include "app/Controller.php";
include "app/Track.php";

$trc = new app\Track();
$rows = $trc->tampil();

?>

<table>
	<tr>
		<th>NO</th>
		<th>JUDUL</th>
		<th>ALBUM</th>
		<th>WAKTU</th>
		<th>PUTAR</th>
		<th>EDIT</th>
	</tr>
	<?php foreach ($rows as $row) { ?>
		<tr>
			<td><?php echo $row['track_id']; ?></td>
			<td><?php echo $row['track_name']; ?></td>
			<td><?php echo $row['ALB'] . " - " . $row['ART']; ?></td>
			<td><?php echo $row['waktu']; ?></td>
			<td>
				<?php if (!empty($row['track_file'])) { ?>
					<audio controls>
						<source src="<?php echo "./layout/assets/uploads/" . $row['track_file']; ?>" type="audio/mpeg">
							Your browser does not support the audio element.
						</audio>					
					<?php } ?>
				</td>
				<td><a href="dashboard.php?page=track_edit&id=<?php echo $row['track_id']; ?>" class="btn">Edit</a></td>
			</tr>
		<?php } ?>
	</table>