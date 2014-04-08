#/etc/puppet/modules/dnsclient/manifests/init.pp

class dnsclient (
  $dnsclient_packages  = [],
  $pkgprovider = '',
) {

  package { $dnsclient_packages: 
    ensure   =>  installed,
  }

  $searchorder = hiera('searchorder')
  $nameserver1 = hiera('nameserver1')
  $nameserver2 = hiera('nameserver2')

  file { 
    '/etc/resolv.conf':
      content => template('/usr/local/etc/puppet/modules/dnsclient/templates/etc/resolv.conf.erb');
  }
}
