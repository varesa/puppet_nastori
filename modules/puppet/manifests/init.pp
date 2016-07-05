class puppet {
    file { "/etc/hosts":
        ensure => "file",
        content => template("puppet/hosts")
    }
    ->
    file { "/etc/puppet/puppet.conf":
        ensure => "file",
        content => template("puppet/puppet.conf")
    }
    ->
    service { "puppet":
        ensure => "running",
        enable => "true"
    }
}
