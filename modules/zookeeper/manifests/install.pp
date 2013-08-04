class zookeeper::install {
  package{"${java_package}":}

  #File definition for the home folder for zookeeper
  file { "${zookeeper_home}":
    ensure => directory,
    owner  => 'root',
    group  => 'root',
  }

  #Zookeeper datadir
  file { "${zookeeper_datadir}":
    ensure   => directory,
    owner    => 'root',
    group    => 'root',
    require  => File[$zookeeper_home],
  }

  #Log folder
  file { "${zookeeper_logdir}":
    ensure   => directory,
    owner    => 'root',
    group    => 'root',
    require  => File[$zookeeper_home],
  }

	#Download and extract the zookeeper archive
  exec { 'zookeeper-get':
  	command => "wget ${zookeeper_mirror}/zookeeper-${zookeeper_version}/zookeeper-${zookeeper_version}.tar.gz -O /var/tmp/zookeeper-${zookeeper_version}.tar.gz",
  	creates => "/var/tmp/zookeeper-${zookeeper_version}.tar.gz",
  	path    => ['/usr/bin', '/usr/sbin', '/sbin', '/bin'],
  	cwd     => '/var/tmp',
  	notify  => Exec['zookeeper-extract'],
  }

    #Install zookeeper
  exec { 'zookeeper-extract':
    command => "tar -C /var/tmp -xzf /var/tmp/zookeeper-${zookeeper_version}.tar.gz",
    creates => "/var/tmp/zookeeper-${zookeeper_version}",
    path    => ['/usr/bin', '/usr/sbin', '/sbin', '/bin'],
    notify  => Exec['zookeeper-install'],
    require => [ Exec["zookeeper-get"]],
  }
  exec { 'zookeeper-install':
    command => "rsync -auzp --exclude=\"src\" /var/tmp/zookeeper-${zookeeper_version}/ ${zookeeper_home}",
    creates => "${zookeeper_home}/zookeeper-${zookeeper_version}.jar",
    path    => ['/usr/bin', '/usr/sbin', '/sbin', 'bin'],
 #   notify  => Service['zookeeper'],
    require => [ Exec["zookeeper-extract"] ,File[$zookeeper_home], Package["${java_package}"] ],
  }
}

