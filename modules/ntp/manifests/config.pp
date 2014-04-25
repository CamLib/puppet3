class ntp::config (
  $servers   = '',
  $driftfile = $ntp::driftfile,
  $statsdir  = $ntp::statsdir,

) {

  File{
    owner   => root,
    group   => root,
    mode    => 644,
  }
 
  file{'/etc/ntp.conf':
    content => template('ntp/ntp.conf.erb');
  }

}
