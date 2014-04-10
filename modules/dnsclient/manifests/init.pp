#/etc/puppet/modules/dnsclient/manifests/init.pp

class dnsclient (
  $dnsclient_packages  = [],
  $nameservers = hiera('nameservers'),
  $pkgprovider = '',
  $resolvtemplate = hiera('resolvtemplate'),
  $searchorder = '',
) {

  package { $dnsclient_packages: 
    ensure   =>  installed,
  }



  file { 
    '/etc/resolv.conf':
      content => template($resolvtemplate);
  }
}
