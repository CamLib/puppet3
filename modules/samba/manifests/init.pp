class samba (
    $version  = 'present',
    $packages = false,

) {
  class{'samba::install': } ->
  class{'samba::config': } ~>
  class{'samba::service': } ->
  Class["samba"]
}
