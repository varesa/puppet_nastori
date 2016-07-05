class nastori_system::sudo {
    file { "/etc/sudoers":
        ensure => "present",
        source => "puppet:///modules/nastori_system/sudoers"
    }
}
