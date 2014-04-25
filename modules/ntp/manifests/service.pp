class ntp::service {
  $ensure = $ntp::start ? {true => running, default => stopped}
 
  service{"ntp":
    ensure  => $ensure,
    enable  => $ntp::enable,
  }

}
