#/etc/puppet/modules/ldapclient/manifests/init.pp

class ldapclient (
  $ldapclient_packages  = [],
  $pkgprovider = '',
) {

  package { $ldapclient_packages: 
    ensure   =>  installed,
  }

  file { 
    '/usr/local/etc/openldap/ldap.conf':
      content => template('/usr/local/etc/puppet/modules/ldapclient/templates/openldap_ldap.conf.erb');
    '/usr/local/etc/ldap.conf':
      content => template('/usr/local/etc/puppet/modules/ldapclient/templates/ldap.conf.erb');
    '/usr/local/etc/nss_ldap.conf':
      ensure  => link,
      target  => '/usr/local/etc/ldap.conf',
      require => File['/usr/local/etc/ldap.conf'];
    '/etc/nsswitch.conf':
      source  => 'puppet:///modules/ldapclient/etc/nsswitch.conf',
      require => File['/usr/local/etc/ldap.conf'];
    '/etc/pam.d/system':
      content => template('/usr/local/etc/puppet/modules/ldapclient/templates/pam_system.erb'),
      require => File['/usr/local/etc/ldap.conf'];
    '/etc/pam.d/sshd':
      content => template('/usr/local/etc/puppet/modules/ldapclient/templates/pam_sshd.erb'),
      require => File['/usr/local/etc/ldap.conf'];
    '/etc/pam.d/su':
      content => template('/usr/local/etc/puppet/modules/ldapclient/templates/pam_su.erb'),
      require => File['/usr/local/etc/ldap.conf'];
  }
}
