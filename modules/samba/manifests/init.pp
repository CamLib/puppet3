class samba (
    $version  = 'latest',
    $packages = '',
    $provider = 'pkgng',

    $configfile = '/etc/smb.conf',

    $workgroup = 'WORKGROUP',
    $security = 'USER',
    $realm = '',

    $service  = ['smbd', 'nmbd'],
    $enable   = true,
    $start    = true,

) {
  class{'samba::install': } ->
  class{'samba::config': } ~>
  class{'samba::service': } ->
  Class["samba"]
}
