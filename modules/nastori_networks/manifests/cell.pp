class nastori_networks::cell($device = '/dev/ttyUSB1', $APN = 'internet', $enabled= 'true') {
    package { "ppp":
        ensure => "present"
    } ->
    package { "usb-modeswitch":
        ensure => "present"
    } ->
    package { "wvdial":
        ensure => "present"
    } ->
    file { "/etc/wvdial.conf":
        ensure  => "file",
        content => template("nastori_networks/wvdial.conf")
    } ->
    file { "/etc/systemd/system/wvdial.service":
        ensure => "file",
        source => "puppet:///modules/nastori_networks/wvdial.service"
    } ->
    service { "wvdial":
        ensure  => "running",
        enable  => "true"
    }
}
