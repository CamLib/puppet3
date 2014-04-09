#/etc/puppet/modules/dnsclient/manifests/init.pp

class dnsclient (
  $dnsclient_packages  = [],
  $modroot = '',
  $nameservers = [],
  $pkgprovider = '',
  $resolvtemplate = "$modroot/dnsclient/templates/resolv.conf.erb",
  $searchorder = '',
) {

  package { $dnsclient_packages: 
    ensure   =>  installed,
  }



  file { 
    '/etc/resolv.conf':
      ## content => template('/usr/local/etc/puppet/modules/dnsclient/templates/resolv.conf.erb');
      content => template($resolvtemplate);
  }
}
