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

  pam::insertline{"pam-zzz-test30":
    target  => $pam_zzz,
    content => "# A dummy line at order 30 to test insertline",
    order => 30,
    }

  pam::insertline{"pam-zzz-test25":
    target  => $pam_zzz,
    content => "# A dummy line at order 25 to test insertline",
    order => 25,
    }

#
# insertline is used by other modules to insert lines in pam config files
#
  define pam::insertline(
    $target = "",
    $content= "", 
    $order=10,

    ) {

    if $target != "" {  
      if $content == "" {
        $body = "# Empty line inserted by $name.  Check your puppet config."
      } else {
        $body = $content
      }

      concat::fragment{"pam__insertline_$name":
      target  => $target,
      order   => $order,
      content => "# Line inserted by puppet ($name),  at order $order.\n$body\n"
     }
   }
}


}
