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

  $pamtest = "/etc/pam.d/zzz"
 
  concat{ $pamtest:
    group  => wheel,
    owner  => root,
    mode   => 0644,
  }

  concat::fragment{"pam-header-2":
    target  => $motd,
    content => "\nThis file is managed fairy dust\n\n",
    order   => 02,
  }

  concat::fragment{"pam-header-1":
    target  => $motd,
    content => "\nThis file is managed fairy dust\n\n",
    order   => 01,
  }

}
