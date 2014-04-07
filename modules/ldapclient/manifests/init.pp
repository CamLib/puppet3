#/etc/puppet/modules/ldapclient/manifests/init.pp

class ldapclient (
  $packages  = [],
) {

$pkgprovider = '',

  package { $packages: 
    ensure   =>  installed,
  }
}
