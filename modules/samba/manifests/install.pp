class samba::install {
    $packages = $samba::packages
    $version = $samba::version
    $provider = $samba::provider

    package{ $packages:
        ensure => $version,
        provider => $provider,
    }
}
