class pkgng::params {
  $repo_name    = "FreeBSD"
  $packagesite  = 'pkg+http://pkg.FreeBSD.org/${ABI}/latest'
  $srv_mirrors  = 'NO'
  $pkg_dbdir    = '/var/db/pkg'
  $pkg_cachedir = '/var/cache/pkg'
  $portsdir     = '/usr/ports'
}
