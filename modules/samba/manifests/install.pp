class samba::install (
) {
    package{ "$samba::packages":
        ensure => $samba::version;
    }
}
