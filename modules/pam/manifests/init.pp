#/etc/puppet/modules/pam/manifests/init.pp

class pam {
  file {
    '/etc/pam.d/system':
      content => template('/usr/local/etc/puppet/modules/pam/templates/pam_system.erb'),
      require => Class['ldapclient'];
    '/etc/pam.d/sshd':
      content => template('/usr/local/etc/puppet/modules/pam/templates/pam_sshd.erb'),
      require => Class['ldapclient'];
    '/etc/pam.d/su':
      content => template('/usr/local/etc/puppet/modules/pam/templates/pam_su.erb'),
      require => Class['ldapclient'];
  }
}
