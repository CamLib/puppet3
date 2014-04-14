#/etc/puppet/modules/pam/manifests/init.pp

class pam {

  ## Files being managed. These are the default
  ## values. As these seem like generic sane defaults.
  ## However you should note that hiera should be populating them.
  $pam_zzz    = "/etc/pam.d/zzz"
  $pam_su     = "/etc/pam.d/su"
  $pam_system = "/etc/pam.d/system"
  $pam_sshd   = "/etc/pam.d/sshd"
 

  ## Content variables, as found in hiera data
  $generic_header  ='' 


  ## Data variables
  $sshd_10_facility   = 'abc'
  $sshd_10_control    = ''
  $sshd_10_modulepath = ''
  $sshd_10_modopts    = ''

  $sshd_15_facility   = ""
  $sshd_15_control    = ""
  $sshd_15_modulepath = ""
  $sshd_15_modopts = ""

  $sshd_20_facility   = ""
  $sshd_20_control    = ""
  $sshd_20_modulepath = ""
  $sshd_20_modopts = ""

  $sshd_25_facility   = ""
  $sshd_25_control    = ""
  $sshd_25_modulepath = ""
  $sshd_25_modopts = ""

  $sshd_30_facility   = ""
  $sshd_30_control    = ""
  $sshd_30_modulepath = ""
  $sshd_30_modopts = ""

  $sshd_35_facility   = ""
  $sshd_35_control    = ""
  $sshd_35_modulepath = ""
  $sshd_35_modopts = ""

  $sshd_50_facility   = ""
  $sshd_50_control    = ""
  $sshd_50_modulepath = ""
  $sshd_50_modopts = ""

  $sshd_55_facility   = ""
  $sshd_55_control    = ""
  $sshd_55_modulepath = ""
  $sshd_55_modopts = ""

  $sshd_60_facility   = ""
  $sshd_60_control    = ""
  $sshd_60_modulepath = ""
  $sshd_60_modopts = ""

  $sshd_65_facility   = ""
  $sshd_65_control    = ""
  $sshd_65_modulepath = ""
  $sshd_65_modopts = ""

  $sshd_70_facility   = ""
  $sshd_70_control    = ""
  $sshd_70_modulepath = ""
  $sshd_70_modopts = ""

  $sshd_80_facility   = ""
  $sshd_80_control    = ""
  $sshd_80_modulepath = ""
  $sshd_80_modopts = ""

  $sshd_85_facility   = ""
  $sshd_85_control    = ""
  $sshd_85_modulepath = ""
  $sshd_85_modopts = ""

  $sshd_90_facility   = ""
  $sshd_90_control    = ""
  $sshd_90_modulepath = ""
  $sshd_90_modopts = ""

  $sshd_95_facility   = ""
  $sshd_95_control    = ""
  $sshd_95_modulepath = ""
  $sshd_95_modopts = ""

  $sshd_100_facility   = ""
  $sshd_100_control    = ""
  $sshd_100_modulepath = ""
  $sshd_100_modopts = ""


  # Declare the files to be created using concat
  concat { $pam_zzz:
    group  => wheel,
    owner  => root,
    mode   => 0644,
  }

  concat { $pam_sshd:
    group  => wheel,
    owner  => root,
    mode   => 0644,
  }

  #concat { $pam_su:
    #group  => wheel,
    #owner  => root,
    #mode   => 0644,
  #}

  #concat { $pam_system:
    #group  => wheel,
    #owner  => root,
    #mode   => 0644,
  #}


  ## Enforce the addition of our puppet warning header
  concat::fragment::puppetwarn::hash{"pam-zzz-puppetwarn":
    target  => $pam_zzz,
  }

  concat::fragment::puppetwarn::hash{"pam-sshd-puppetwarn":
    target  => $pam_sshd,
  }

  #concat::fragment::puppetwarn::hash{"pam-su-puppetwarn":
    #target  => $pam_su,
  #}

  #concat::fragment::puppetwarn::hash{"pam-system-puppetwarn":
    #target  => $pam_system,
  #}

  ## Drop in the default header for the file
  concat::fragment{"pam-zzz-header":
    target  => $pam_zzz,
    content => $generic_header,
    order   => 05,
  }

  concat::fragment{"pam-sshd-header":
    target  => $pam_sshd,
    content => $generic_header,
    order   => 05,
  }

  #concat::fragment{"pam-su-header":
    #target  => $pam_su,
    #content => $generic_header,
    #order   => 05,
  #}

  #concat::fragment{"pam-system-header":
    #target  => $pam_system,
    #content => $generic_header,
    #order   => 05,
  #}


  pam::insertline{"pam-zzz-test":
    target         => $pam_zzz,
    order          => "55",
    pam_facility   => "auth",
    pam_control    => "required",
    pam_modulepath => "pam_opie.so",
    pam_modopts    => "no_warn",
  }


  pam::insertline{"pam-sshd-10":
    target         => $pam_sshd,
    order          => "010",
    pam_facility   => $sshd_10_facility,
    pam_control    => $sshd_10_control,
    pam_modulepath => $sshd_10_modulepath,
    pam_modopts    => $sshd_10_modopts,
  }

  pam::insertline{"pam-sshd-15":
    target         => $pam_sshd,
    order          => "015",
    pam_facility   => $sshd_15_facility,
    pam_control    => $sshd_15_control,
    pam_modulepath => $sshd_15_modulepath,
    pam_modopts    => $sshd_15_modopts,
  }

  pam::insertline{"pam-sshd-20":
    target         => $pam_sshd,
    order          => "020",
    pam_facility   => $sshd_20_facility,
    pam_control    => $sshd_20_control,
    pam_modulepath => $sshd_20_modulepath,
    pam_modopts    => $sshd_20_modopts,
  }

  pam::insertline{"pam-sshd-25":
    target         => $pam_sshd,
    order          => "025",
    pam_facility   => $sshd_25_facility,
    pam_control    => $sshd_25_control,
    pam_modulepath => $sshd_25_modulepath,
    pam_modopts    => $sshd_25_modopts,
  }

  pam::insertline{"pam-sshd-30":
    target         => $pam_sshd,
    order          => "030",
    pam_facility   => $sshd_30_facility,
    pam_control    => $sshd_30_control,
    pam_modulepath => $sshd_30_modulepath,
    pam_modopts    => $sshd_30_modopts,
  }

  pam::insertline{"pam-sshd-35":
    target         => $pam_sshd,
    order          => "035",
    pam_facility   => $sshd_35_facility,
    pam_control    => $sshd_35_control,
    pam_modulepath => $sshd_35_modulepath,
    pam_modopts    => $sshd_35_modopts,
  }

  pam::insertline{"pam-sshd-50":
    target         => $pam_sshd,
    order          => "050",
    pam_facility   => $sshd_50_facility,
    pam_control    => $sshd_50_control,
    pam_modulepath => $sshd_50_modulepath,
    pam_modopts    => $sshd_50_modopts,
  }

  pam::insertline{"pam-sshd-55":
    target         => $pam_sshd,
    order          => "055",
    pam_facility   => $sshd_55_facility,
    pam_control    => $sshd_55_control,
    pam_modulepath => $sshd_55_modulepath,
    pam_modopts    => $sshd_55_modopts,
  }

  pam::insertline{"pam-sshd-60":
    target         => $pam_sshd,
    order          => "060",
    pam_facility   => $sshd_60_facility,
    pam_control    => $sshd_60_control,
    pam_modulepath => $sshd_60_modulepath,
    pam_modopts    => $sshd_60_modopts,
  }

  pam::insertline{"pam-sshd-65":
    target         => $pam_sshd,
    order          => "065",
    pam_facility   => $sshd_65_facility,
    pam_control    => $sshd_65_control,
    pam_modulepath => $sshd_65_modulepath,
    pam_modopts    => $sshd_65_modopts,
  }

  pam::insertline{"pam-sshd-70":
    target         => $pam_sshd,
    order          => "070",
    pam_facility   => $sshd_70_facility,
    pam_control    => $sshd_70_control,
    pam_modulepath => $sshd_70_modulepath,
    pam_modopts    => $sshd_70_modopts,
  }

  pam::insertline{"pam-sshd-80":
    target         => $pam_sshd,
    order          => "080",
    pam_facility   => $sshd_80_facility,
    pam_control    => $sshd_80_control,
    pam_modulepath => $sshd_80_modulepath,
    pam_modopts    => $sshd_80_modopts,
  }

  pam::insertline{"pam-sshd-85":
    target         => $pam_sshd,
    order          => "085",
    pam_facility   => $sshd_85_facility,
    pam_control    => $sshd_85_control,
    pam_modulepath => $sshd_85_modulepath,
    pam_modopts    => $sshd_85_modopts,
  }

  pam::insertline{"pam-sshd-90":
    target         => $pam_sshd,
    order          => "090",
    pam_facility   => $sshd_90_facility,
    pam_control    => $sshd_90_control,
    pam_modulepath => $sshd_90_modulepath,
    pam_modopts    => $sshd_90_modopts,
  }

  pam::insertline{"pam-sshd-95":
    target         => $pam_sshd,
    order          => "095",
    pam_facility   => $sshd_95_facility,
    pam_control    => $sshd_95_control,
    pam_modulepath => $sshd_95_modulepath,
    pam_modopts    => $sshd_95_modopts,
  }

  pam::insertline{"pam-sshd-100":
    target         => "$pam_sshd",
    order          => "100",
    pam_facility   => "$sshd_100_facility",
    pam_control    => "$sshd_100_control",
    pam_modulepath => "$sshd_100_modulepath",
    pam_modopts    => "$sshd_100_modopts",
  }
}
