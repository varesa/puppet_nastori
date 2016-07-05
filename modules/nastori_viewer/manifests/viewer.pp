class nastori_viewer::viewer {
    include nastori_viewer::params
    require git

    vcsrepo { $nastori_viewer::params::git_dest:
        ensure   => "latest",
        provider => "git",
        source   => $nastori_viewer::params::git_url,
        revision => $nastori_viewer::params::git_revision
    }

    package { "qt4-default":
        ensure => "present"
    }

    package { "libqtwebkit-dev":
        ensure => "present"
    }

    exec { "viewer_qmake":
        command => "qmake",
        path    => "/usr/bin/",
        cwd     => $nastori_viewer::params::git_dest,
        creates => "${nastori_viewer::params::git_dest}/Makefile"
    }

    Package['qt4-default'] -> Exec['viewer_qmake']
    Package['libqtwebkit-dev'] -> Exec['viewer_qmake']

    package { "make":
        ensure => "present"
    }

    package { "g++":
        ensure => "present"
    }

    exec { "viewer_make":
        command => "make",
        path    => "/usr/bin/",
        cwd     => $nastori_viewer::params::git_dest,
        creates => "${nastori_viewer::params::git_dest}/webviewer",
        timeout => 1800
    }

    Package['make'] -> Exec['viewer_make']
    Package['g++'] -> Exec['viewer_make']

    Vcsrepo[$nastori_viewer::params::git_dest] -> Exec['viewer_qmake'] -> Exec['viewer_make']

    file { "/home/nastori/url.txt":
        ensure  => "file",
        content => $nastori_viewer::params::viewer_url
    }
}
