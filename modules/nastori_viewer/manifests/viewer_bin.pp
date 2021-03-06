class nastori_viewer::viewer_bin($reboot = false) {
    include nastori_viewer::params
    require git

    $packages = [ 'libqtwebkit-dev', 'qt4-default' ]
  
    exec { "reboot":
            command     => "reboot",
            path        => "/sbin/",
            refreshonly => true
    }

    if($reboot) {
        $notify = Exec["reboot"]
    } else {
        $notify = undef
    }

    package { $packages:
        ensure => "present"
    }
    ->
    vcsrepo { $nastori_viewer::params::git_dest:
        ensure   => "latest",
        provider => "git",
        force    => "true",
        source   => $nastori_viewer::params::git_url_bin,
        revision => $nastori_viewer::params::git_revision,
        notify   => $notify
    }
}
