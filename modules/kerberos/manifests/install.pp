class kerberos::install {

  if $kerberos::packages {
    package{ $kerberos::packages:
      ensure => $kerberos::version
    }
  }

}
