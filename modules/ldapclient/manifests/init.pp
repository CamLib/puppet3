#/etc/puppet/modules/ldapclient/manifests/init.pp

class ldapclient {

  ## Define packages per OS.
  case $operatingsystem: { 
    'FreeBSD': {
      ## Now check for the version of the OS.
      case $operatingsystemrelease: {
        '10.0-RELEASE': {
          $packages  =
          [ 'openldap-client-24.38', 'nss_ldap-1.265_9',
            'pam_ldap-1.8.6_2', 'pam_mkhomedir-0.2'
          ],
        }
      }
   }
   default =>
     [
     ]
  }

  package { $packages: 
    ensure =>  installed,
  }
}
