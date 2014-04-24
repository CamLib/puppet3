class samba::service {
    $ensure = $samba::start ? {true => running, default => stopped}

    service{"samba":
        ensure  => $ensure,
        enable  => $samba::enable,
    }
}
