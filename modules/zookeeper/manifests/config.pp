class zookeeper::config{

  #File definition for the home folder for zookeeper
  file { "${zookeeper::params::zookeeper_home}":
    ensure => directory,
    owner  => 'root',
    group  => 'root',
  }

  #Zookeeper datadir
  file { "${zookeeper::params::zookeeper_datadir}":
    ensure   => directory,
    owner    => 'root',
    group    => 'root',
    require  => File[$zookeeper::params::zookeeper_home],
  }

  #Log folder
  file { "${zookeeper::params::zookeeper_logdir}":
    ensure   => directory,
    owner    => 'root',
    group    => 'root',
    require  => File[$zookeeper::params::zookeeper_home],
  }



  #Define zookeeper config file for cluster
  file { "${zookeeper::params::zookeeper_home}/conf/zoo.cfg":
    ensure => present,
    content => template("zookeeper/zoo.cfg.erb"),
    owner   => '0',
    group   => '0',
    mode    => '0644',
    require  => [File[$zookeeper::params::zookeeper_home], Exec['zookeeper-get']]
  }

  #Add myid file to each node configured
  file { "${zookeeper::params::zookeeper_datadir}/myid":
    ensure  => present,
    content => $zookeeper::params::zookeeper_myid,
    require => File[$zookeeper::params::zookeeper_datadir],
  }

  #Collect exported servers and realize to the zookeeper config file
  #Zookeeper::Servernode <<| group == $group |>>

}
