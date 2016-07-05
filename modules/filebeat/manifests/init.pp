class filebeat {
    include supervisor

    exec { "download_filebeat":
        command => "/usr/bin/wget -q https://beats-nightlies.s3.amazonaws.com/jenkins/filebeat/531-c138b6c29d723ea7192b5181308fe4a5f2884049/filebeat-linux-arm -O /usr/sbin/filebeat",
        creates => "/usr/sbin/filebeat"
    }
    ->
    file { "/usr/sbin/filebeat":
        owner => "root",
        mode => "755"
    }
    ->
    file { "/etc/filebeat.yml":
        ensure => "present",
        source => "puppet:///modules/filebeat/filebeat.yml"
    }
    ->
    file { "/etc/supervisor/conf.d/filebeat.conf":
        ensure => "present",
        source => "puppet:///modules/filebeat/supervisor.conf",
        notify => Service["supervisor"]
    }

}
