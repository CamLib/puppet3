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

  $motd = "/etc/motd"

   concat{$motd:
      owner => root,
      group => wheel,
      mode  => '0644',
   }

   concat::fragment{"motd_header":
      target => $motd,
      content => "\nPuppet modules on this server:\n\n",
      order   => 01,
   }

   # local users on the machine can append to motd by just creating
   # /etc/motd.local
   concat::fragment{"motd_local":
      target => $motd,
      ensure  => "/etc/motd.local",
      order   => 15
   }
}
