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


  pam::insertline{"pam-zzz-test":
    target         => $pam_zzz,
    order          => "55",
    pam_facility   => "auth",
    pam_control    => "required",
    pam_modulepath => "pam_opie.so",
    pam_modopts    => "no_warn",
  }

  define recursion(
    $count
) {
    $testarray1 = ['a','b','c','d']
    # do something here...
    $thisval = inline_template('<%= testarray1.length %>')
    notify { "count-${count} $thisval":
    }
    $minus1 = inline_template('<%= count.to_i - 1 %>')
    if "${minus1}" == '0' {
        notify { 'done counting!':
        }
    } else {
        # recurse
        recursion { "count-${minus1}":
            count => $minus1,
        }
    }
}

# kick it off...
recursion { 'start':
    count => 4,
}
}
