<?php 

namespace app;


class Played extends Controller {

	public function __construct() {
		parent::__construct();
	}

	public function tampil()
	{
		$sql = "SELECT *
		FROM tb_played tr 
		INNER JOIN tb_track al ON tr.played_id_track=al.track_id";
		$stmt = $this->db->prepare($sql);
		$stmt->execute();

		$data = [];
		while ($row = $stmt->fetch()) {
			$data[] = $row;
		}

		return $data;
	}

}