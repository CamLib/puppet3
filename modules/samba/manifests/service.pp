class samba::service {
    $ensure = $samba::start ? {true => running, default => stopped}

    service{ $samba::service:
        ensure  => $ensure,
        enable  => $samba::enable,
    }
}
