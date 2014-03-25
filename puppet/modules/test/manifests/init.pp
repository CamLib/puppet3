class test ( 
  $some_parameter  = 'value',
  $other_parameter = 'value',
) {

  file {'/tmp/test1':
    ensure  => present,
    content => "$some_parameter",
  }

  file {'/tmp/test2':
    ensure => directory,
    mode   => 644,
  }

  file {'/tmp/test3':
    ensure => link,
    target => '/tmp/test1',
  }

  notify{"This is a test notice spewing a $some_parameter": }
  notify{"This is a test notice spewing a $other_parameter": }

}
