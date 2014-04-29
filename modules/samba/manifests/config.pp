class samba::config {
    $configfile = $samba::configfile
    $workgroup = $samba::workgroup
    $security = $samba::security
    $realm = $samba::realm

    file{ $configfile:
         content => template('samba/smb.conf.erb');
    }
}
