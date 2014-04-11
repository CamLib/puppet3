#/etc/puppet/modules/pam/manifests/init.pp

class pam {

  ## Files being managed
  $pam_zzz    = "/etc/pam.d/zzz"
  $pam_su     = "/etc/pam.d/su"
  $pam_system = "/etc/pam.d/system"
  $pam_sshd   = "/etc/pam.d/sshd"
 

  ## Content variables, as found in hiera data
  $system_header  = ""




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
    content => $system_header,
    order   => 05,
  }

  pam::insertline{"pam-zzz-array":
    target         => $pam_zzz,
    order          => "55",
    pam_facility   => "auth",
    pam_control    => $testarray1,
    pam_modulepath => $testarray2,
    pam_modopts    => "",
  }


  pam::insertline{"pam-zzz-test":
    target         => $pam_zzz,
    order          => "55",
    pam_facility   => "auth",
    pam_control    => "required",
    pam_modulepath => "pam_opie.so",
    pam_modopts    => "no_warn",
  }
}
