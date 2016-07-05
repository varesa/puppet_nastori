class nastori_sync::displayid ($displayid = 'test') {
    file { "/boot/NAYTON_NIMI.txt":
        ensure => "file",
        content => "$displayid"
    }
}
