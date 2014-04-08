#/etc/puppet/modules/ldapclient/manifests/init.pp

class ldapclient (
  $packages  = [],
  $pkgprovider = '',
) {

  package { $packages: 
    ensure   =>  installed,
  }

  file { 
    '/usr/local/etc/openldap/ldap.conf':
      content => template('/usr/local/etc/puppet/modules/ldapclient/templates/usr/local/etc/openldap/ldap.conf.erb');
    '/usr/local/etc/ldap.conf':
      content => template('/usr/local/etc/puppet/modules/ldapclient/templates/usr/local/etc/ldap.conf.erb');
    '/usr/local/etc/nss_ldap.conf':
      ensure  => link,
      target  => '/usr/local/etc/ldap.conf',
      require => File['/usr/local/etc/ldap.conf'];
  }
}
