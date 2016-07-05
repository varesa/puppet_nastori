class nastori_sync::sync {
    include nastori_sync::params
    require git

    package { 's3cmd':
        ensure => 'present',
    }
    ->
    vcsrepo { $nastori_sync::params::git_dest:
        ensure    => "latest",
        provider  => "git",
        source    => $nastori_sync::params::git_url,
        revision  => $nastori_sync::params::git_revision
    }
    ->
    file { "${nastori_sync::params::git_dest}/sync":
        ensure => "directory",
        owner  => "nastori"
    }
    ->
    file { "${nastori_sync::params::git_dest}/sync/dir1":
        ensure => "directory",
        owner  => "nastori"
    }
    ->
    file { "${nastori_sync::params::git_dest}/sync/dir2":
        ensure => "directory",
        owner  => "nastori"
    }
    ->
    file { "/var/log/sync":
        ensure => "file",
        owner  => "nastori"
    }
    ->
    file { "/var/log/sync.err":
        ensure => "file",
        owner => "nastori"
    }
    ->
    cron { "sync_job":
        ensure  => "present",
        user    => "nastori",
        command => "${nastori_sync::params::git_dest}/update.sh >/var/log/sync 2>/var/log/sync.err",
        hour    => "*",
        minute  => "*/15"
    }
}
