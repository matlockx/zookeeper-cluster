class zookeeper::service {

  exec { 'zookeeper-start':
    command => 'zkServer.sh restart',
    cwd     => "${zookeeper_home}/bin",
    path    => ['/bin', '/sbin', '/usr/bin', '/usr/sbin',
                "${zookeeper_home}/bin"
    ],
    require => File[$zookeeper_home],
    unless  => "netstat -ln | grep ':3888'",
  }

}