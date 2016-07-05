class nastori_sync::server {
    package { 'nginx':
        ensure => 'present'
    }
    ->
    file { "/etc/nginx/sites-enabled/default":
        ensure => 'file',
        content => template("nastori_sync/nginx-site.erb"),
        notify => Service['nginx']
    }
    ->
    service { 'nginx':
        ensure => 'running',
        enable => true
    }
}
