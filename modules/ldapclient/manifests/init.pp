#/etc/puppet/modules/ldapclient/manifests/init.pp


class ldapclient (
  $packages  = [],
) {

  package { $packages: 
    ensure =>  installed,
  }
}
