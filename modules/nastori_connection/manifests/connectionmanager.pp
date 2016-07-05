class nastori_connection::connectionmanager {
    require git

    include nastori_connection::params

    vcsrepo { $nastori_connection::params::git_dest:
        ensure   => 'latest',
        provider => 'git',
        source   => $nastori_connection::params::git_url,
        revision => $nastori_connection::params::git_revision,
    }
    ->
    file { '/etc/supervisor/conf.d/connectionmanager.conf':
        ensure => 'present',
        source => "file://${nastori_connection::params::git_dest}/supervisor.conf",
        notify => Service['supervisor']
    }
}
