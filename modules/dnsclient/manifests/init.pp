#/etc/puppet/modules/dnsclient/manifests/init.pp

class dnsclient (
  $dnsclient_packages  = [],
  $pkgprovider = '',
) {

  package { $dnsclient_packages: 
    ensure   =>  installed,
  }

  $searchorder = hiera('searchorder')
  $nameservers = hiera('nameservers')

  file { 
    '/etc/resolv.conf':
      content => template('/usr/local/etc/puppet/modules/dnsclient/templates/etc/resolv.conf.erb');
  }
}
