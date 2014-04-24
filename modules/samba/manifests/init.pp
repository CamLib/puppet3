class samba (
    $version  = 'present',
    $packages = false,
    $service  = false,
    $enable   = false,
    $start    = false,
) {
  class{'samba::install': } ->
  class{'samba::config': } ~>
  class{'samba::service': } ->
  Class["samba"]
}
