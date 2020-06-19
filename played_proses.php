<?php 

include_once "app/controller.php";

include "app/Played.php";

$played = new app\Played();

if ($_POST['btn-simpan']) {
	$played->tambah();
	header("location:dashboard.php?page=played_tampil");
}

if ($_POST['btn-edit']) {
	$played->update();
header("location:dashboard.php?page=played_tampil");
}

if ($_GET['delete-id']) {
	$played->hapus($_GET['delete-id']);
	header("location:dashboard.php?page=played_tampil");
}