class zookeeper(
	$server_ensemble = zookeeper::params::zookeeper_ensemble_servers,
	$myid = zookeeper::params::zookeeper_myid
) inherits zookeeper::params{

	include zookeeper::install, zookeeper::config, zookeeper::service

}
