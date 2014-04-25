class ntp (
  $version = 'latest',
  $servers = ['1.pool.ntp.org', '2.pool.ntp.org'],
  $statsdir = '/var/log/ntpstats',
  $driftfile = '/var/lib/ntp/ntp.drift',
  $enable = true,
  $start = true,

) {

  class{'ntp::install': } ->
  class{'ntp::config': } ~>
  class{'ntp::service': } ->
  Class["ntp"]

}
