class kerberos::config (
    $realm = $kerberos::realm,
    $domain = $kerberos::domain,
    $servers = $kerberos::servers,

) {
 
  file{'/etc/krb5.conf':
    content => template('kerberos/krb5.conf.erb');
  }

}
