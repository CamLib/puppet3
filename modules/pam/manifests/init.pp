#/etc/puppet/modules/pam/manifests/init.pp

class pam {
  #file {
    #'/etc/pam.d/system':
      #content => template('/usr/local/etc/puppet/modules/pam/templates/pam_system.erb'),
      #require => Class['ldapclient'];
    #'/etc/pam.d/sshd':
      #content => template('/usr/local/etc/puppet/modules/pam/templates/pam_sshd.erb'),
      #require => Class['ldapclient'];
    #'/etc/pam.d/su':
      #content => template('/usr/local/etc/puppet/modules/pam/templates/pam_su.erb'),
      #require => Class['ldapclient'];
  #}

  $pam_zzz    = "/etc/pam.d/zzz"
  $pam_su     = "/etc/pam.d/su"
  $pam_system = "/etc/pam.d/system"
  $pam_sshd   = "/etc/pam.d/sshd"
 
  concat { $pam_zzz:
    group  => wheel,
    owner  => root,
    mode   => 0644,
  }

  concat::fragment::puppetwarn::hash{"pam-zzz-puppetwarn":
    target  => $pam_zzz,
    order   => 01,
  }

  concat::fragment{"pam-header-1":
    target  => $pam_zzz,
    content => "\nThis file is not managed fairy dust\n\n",
    order   => 99,
  }

}
