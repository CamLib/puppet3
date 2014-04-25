class ntp::config (
  $servers   = $ntp::servers,
  $driftfile = $ntp::driftfile,
  $statsdir  = $ntp::statsdir,

) {
 
  file{'/etc/ntp.conf':
    content => template('ntp/ntp.conf.erb');
  }

}
