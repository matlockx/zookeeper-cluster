class zookeeper::install {
	#Download and extract the zookeeper archive
  exec { 'zookeeper-get':
  	command => "wget ${zookeeper::params::zookeeper_mirror}/zookeeper-${zookeeper::params::zookeeper_version}/zookeeper-${zookeeper::params::zookeeper_version}.tar.gz -O /var/tmp/zookeeper-${zookeeper::params::zookeeper_version}.tar.gz",
  	creates => "/var/tmp/zookeeper-${zookeeper::params::zookeeper_version}.tar.gz",
  	path    => ['/usr/bin', '/usr/sbin', '/sbin', '/bin'],
  	cwd     => '/var/tmp',
  	notify  => Exec['zookeeper-extract'],
  }

    #Install zookeeper
  exec { 'zookeeper-extract':
    command => "tar -C /var/tmp -xzf /var/tmp/zookeeper-${zookeeper::params::zookeeper_version}.tar.gz",
    creates => "/var/tmp/zookeeper-${zookeeper::params::zookeeper_version}",
    path    => ['/usr/bin', '/usr/sbin', '/sbin', '/bin'],
    notify  => Exec['zookeeper-install'],
  }
  exec { 'zookeeper-install':
    command => "rsync -auzp --exclude=\"src\" /var/tmp/zookeeper-${zookeeper::params::zookeeper_version}/ ${zookeeper::params::zookeeper_home}",
    creates => "${zookeeper::params::zookeeper_home}/zookeeper-${zookeeper::params::zookeeper_version}.jar",
    path    => ['/usr/bin', '/usr/sbin', '/sbin', 'bin'],
 #   notify  => Service['zookeeper'],
    require => [ File[$zookeeper::params::zookeeper_home], Package[$zookeeper::params::java_package] ],
  }
}

