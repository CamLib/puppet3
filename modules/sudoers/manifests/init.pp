#/etc/puppet/modules/sudoers/manifests/init.pp

class sudoers (
  $sudoers_packages  = [],
  $pkgprovider = '',
) {

  package { $sudoers_packages: 
    ensure   =>  installed,
  }

  $sudoers_file = '',
  $sudoers_template = '',


  file { 
    "$sudoers_file":
      content => template("$sudoers_template");
  }
}
