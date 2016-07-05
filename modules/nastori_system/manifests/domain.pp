class nastori_system::domain {
    file { "/etc/dhcpcd.conf":
        ensure => "present",
        source => "puppet:///modules/nastori_system/dhcpcd.conf"
    }
}
