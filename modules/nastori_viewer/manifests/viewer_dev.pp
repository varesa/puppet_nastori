class nastori_viewer::viewer_dev {
    include nastori_viewer::params
    require git

    $packages = [ 'git', 'g++', 'libqtwebkit-dev', 'make', 'qt4-default' ]
  
    package { $packages:
        ensure => "present"
    }
    ->
    vcsrepo { $nastori_viewer::params::git_dest:
        ensure   => "latest",
        provider => "git",
        source   => $nastori_viewer::params::git_url,
        revision => $nastori_viewer::params::git_revision,
        notify   => Exec["viewer_qmake"]
    }
    ->
    exec { "viewer_qmake":
        command => "qmake",
        path    => "/usr/bin/",
        cwd     => $nastori_viewer::params::git_dest,
        #creates => "${nastori_viewer::params::git_dest}/Makefile",
        refreshonly => true,
        notify  => Exec["viewer_make"]
    }
    ->
    exec { "viewer_make":
        command => "make",
        path    => "/usr/bin/",
        cwd     => $nastori_viewer::params::git_dest,
        #creates => "${nastori_viewer::params::git_dest}/webviewer",
        refreshonly => true,
        timeout => 2000,
        #notify  => Exec["reboot"]
    }
    ->
    exec { "reboot":
        command     => "reboot",
        path        => "/sbin/",
        refreshonly => true
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
