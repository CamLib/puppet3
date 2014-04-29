class samba (
    $version  = 'latest',
    $packages = '',

    $configfile = '/etc/smb.conf',

    $workgroup = 'WORKGROUP',
    $security = 'USER',
    $realm = '',

    $service  = ['smbd', 'nmbd'],
    $enable   = false,
    $start    = false,

) {
  class{'samba::install': } ->
  class{'samba::config': } ~>
  class{'samba::service': } ->
  Class["samba"]
}
