class ntp::service {
  $ensure = $ntp::start ? {true => running, default => stopped}
  $servicename = $ntp::servicename 
  service{ $servicename:
    ensure  => $ensure,
    enable  => $ntp::enable,
  }

}
