#/etc/puppet/modules/pam/manifests/init.pp

class pam {

  ## Files being managed
  $pam_zzz    = "/etc/pam.d/zzz"
  $pam_su     = "/etc/pam.d/su"
  $pam_system = "/etc/pam.d/system"
  $pam_sshd   = "/etc/pam.d/sshd"
 

  ## Content variables, as found in hiera data
  $system-header  = "",




  concat { $pam_zzz:
    group  => wheel,
    owner  => root,
    mode   => 0644,
  }

  concat::fragment::puppetwarn::hash{"pam-zzz-puppetwarn":
    target  => $pam_zzz,
  }

  concat::fragment{"pam-system-header":
    target  => $pam_zzz,
    content => $system-header,
    order   => 05,
  }

}
