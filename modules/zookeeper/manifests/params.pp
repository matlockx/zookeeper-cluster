class zookeeper::params {

  $zookeeper_version    = '3.4.5'
  $zookeeper_mirror     = 'http://mirrors.sonic.net/apache/zookeeper'
  $zookeeper_home       = '/opt/zookeeper'
  $zookeeper_datadir    = "${zookeeper::params::zookeeper_home}/data"
  $zookeeper_logdir     = "${zookeeper::params::zookeeper_home}/logs"
  $zookeeper_clientport = '2181'
  $zookeeper_myid = '1'
  $zookeeper_ensemble_servers = [$fqdn]


  case $::operatingsystem {
    'RedHat', 'CentOS': {
      $java_package = 'java-1.7.0-openjdk'
    }
    'Debian', 'Ubuntu': {
      $java_package = 'openjdk-7-jdk'
    }
    default: { }
  }

}