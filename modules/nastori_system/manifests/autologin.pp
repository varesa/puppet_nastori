class nastori_system::autologin {
    file { "/etc/systemd/system/autologin@.service":
        ensure => "file",
        source => "puppet:///modules/nastori_system/autologin@.service"
    }
    ini_setting { "autologin-user":
      ensure => "present",
      path => "/etc/lightdm/lightdm.conf",
      section => "SeatDefaults",
      setting => "autologin-user",
      value => "nastori"
    }
}
