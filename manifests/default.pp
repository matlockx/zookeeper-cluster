import "zookeeper"

class { 'zookeeper':
	myid => '2',
	server_ensemble => ['192.168.33.11', '192.168.33.12','192.168.33.13'],
	
	
}
node 'zookeeper1' {
	include zookeeper	
}
