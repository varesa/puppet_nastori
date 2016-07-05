class nastori_displayconfig($hdmi_force_mode = 0, $hdmi_mode = 1, $hdmi_group = 1,
                            $display_rotate = 0,
                            $overscan_top = 16, $overscan_left = 16,
                            $overscan_right = 16, $overscan_bottom = 16) {
    file { "/boot/config.txt":
        ensure => "file",
        content => template("nastori_displayconfig/config.txt.erb")
    }
}
