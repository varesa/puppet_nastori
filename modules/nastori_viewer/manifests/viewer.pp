class nastori_viewer::viewer ($devel = false, $reboot = false){
	if($devel == true) {
		class {'nastori_viewer::viewer_dev':
			reboot => $reboot
		}
	} else {
		class {'nastori_viewer::viewer_bin':
			reboot => $reboot
		}
	}

    file { "/home/nastori/url.txt":
        ensure  => "file",
        owner   => "nastori",
        content => $nastori_viewer::params::viewer_url
    }
    
    file { "/home/nastori/geom.txt":
        ensure  => "file",
        owner   => "nastori",
        content => $nastori_viewer::params::geom
    }
}