class ntp (
  $version = 'latest',
  $ntpservers = ['1.pool.ntp.org', '2.pool.ntp.org'],
  $enable = true,
  $start = true

) {

  class{'ntp::install': } ->
  class{'ntp::config': } ~>
  class{'ntp::service': } ->
  Class["ntp"]

}
