#/etc/puppet/modules/dnsclient/manifests/init.pp

class dnsclient (
  $packages            = [],
  $nameservers         = [],
  $pkgprovider         = '',
  $resolvtemplate      = '',
  $searchorder         = '',
) {

  package { $packages: 
    ensure   =>  installed,
  }

  file { 
    '/etc/resolv.conf':
      content => template('dnsclient/resolv.conf.erb');
  }
}
