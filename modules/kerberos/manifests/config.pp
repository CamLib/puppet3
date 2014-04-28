class kerberos::config (
    $realm = $kerberos::realm,

) {
 
  file{'/etc/krb5.conf':
    content => template('kerberos/krb5.conf.erb');
  }

}
