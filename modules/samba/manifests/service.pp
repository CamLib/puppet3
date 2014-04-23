class samba::service {
    service{"samba":
        ensure  => 'running',
        enable  => true,
    }
}
