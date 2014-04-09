#/etc/puppet/modules/dnsclient/manifests/init.pp

class dnsclient (
  $dnsclient_packages  = [],
  $nameservers = hiera('namservers'),
  $pkgprovider = '',
  $resolvtemplate = hiera('resolvtemplate'),
  $searchorder = hiera('searchorder'),
) {

  package { $dnsclient_packages: 
    ensure   =>  installed,
  }



  file { 
    '/etc/resolv.conf':
      content => template($resolvtemplate);
  }
}
