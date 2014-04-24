#/usr/local/etc/puppet/modules/base/manifests/init.pp

class base (
  $packages  = [],
  $pkgprovider = '',
) {


  package { $packages: 
    ensure   =>  installed,
  }
}
