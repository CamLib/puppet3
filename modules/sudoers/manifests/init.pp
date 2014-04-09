#/etc/puppet/modules/sudoers/manifests/init.pp

class sudoers (
  $sudoers_packages  = [],
  $pkgprovider = '',
  $sudoers_file = '',
  $sudoers_template = 'foo',
) {

  debug ($sudoers_template)
  package { $sudoers_packages: 
    ensure   =>  installed,
  }



  file { 
    "$sudoers_file":
      content => template($sudoers_template);
  }
}
