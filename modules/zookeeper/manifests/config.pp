class zookeeper::config{

  #Define zookeeper config file for cluster
  file { "${zookeeper_home}/conf/zoo.cfg":
    ensure => present,
    content => template("zookeeper/zoo.cfg.erb"),
    owner   => '0',
    group   => '0',
    mode    => '0644',
    require  => [File[$zookeeper_home], Exec['zookeeper-install']]
  }

  file { "${zookeeper_datadir}/myid":
    ensure => present,
    content => template("zookeeper/myid.erb"),
    owner   => '0',
    group   => '0',
    mode    => '0644',
    require  => [File[$zookeeper_home], Exec['zookeeper-install']]
  }


  #Collect exported servers and realize to the zookeeper config file
  #Zookeeper::Servernode <<| group == $group |>>

}
