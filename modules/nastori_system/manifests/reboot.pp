class nastori_system::reboot {
    cron { "reboot":
        ensure  => "present",
        command => "/sbin/reboot",
        hour    => "00",
        minute  => "00"
    }
}
