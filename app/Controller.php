<?php 

namespace app;
use PDO;

class controller
{
	protected $db;

	public function __construct()
	{
		try {
			$this->db = new PDO ("mysql:host=localhost;dbname=db_adel","root","");
		} catch (Exception $e) {
			die("error!" . $e->getMessage());
		}
	}
}

 ?>