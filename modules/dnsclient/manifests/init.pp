#/etc/puppet/modules/dnsclient/manifests/init.pp

class dnsclient (
  $dnsclient_packages  = [],
  $pkgprovider = '',
) {

  package { $dnspclient_packages: 
    ensure   =>  installed,
  }

  file { 
    '/etc/resolv.conf':
      content => template('/usr/local/etc/puppet/modules/dnsclient/templates/etc/resolv.conf.erb');
  }
}
