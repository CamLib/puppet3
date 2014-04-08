#/etc/puppet/modules/ldapclient/manifests/init.pp

class ldapclient (
  $packages  = [],
  $pkgprovider = '',
) {


  package { $packages: 
    ensure   =>  installed,
  }

  file { '/usr/local/etc/openldap/ldap.conf':
    content => template('/usr/local/etc/puppet/modules/ldapclient/templates/sur/local/etc/openldap/ldap.conf.erb'),
  }
}
