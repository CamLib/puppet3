class kerberos (
  $version = 'latest',
  $servers = ['addc01.ad.lib.cam.ac.uk', 'addc02.ad.lib.cam.ac.uk', 'addc03.ad.lib.cam.ac.uk'],
  $domain  = 'ad.lib.cam.ac.uk',
  $realm   = 'AD.LIB.CAM.AC.UK',
  $enable  = true,
  $start   = true,

) {

  class{'kerberos::install': } ->
  class{'kerberos::config': } ~>
  class{'kerberos::service': } ->
  Class["kerberos"]

}
