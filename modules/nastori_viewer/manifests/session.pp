class nastori_viewer::session {
  file { "session_file":
    path   => "/usr/share/xsessions/nastori_viewer.desktop",
    ensure => "file",
    source => "puppet:///modules/nastori_viewer/nastori_viewer.desktop"
  }
  ini_setting { "default_session":
    ensure => "present",
    path => "/etc/lightdm/lightdm.conf",
    section => "SeatDefaults",
    setting => "user-session",
    value => "nastori_viewer"
  }
}