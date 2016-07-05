class nastori_viewer::noblank {
    file { "/etc/X11/Xsession.d/90powersave":
        ensure => "file",
        source => "puppet:///modules/nastori_viewer/90powersave"
    }
}
