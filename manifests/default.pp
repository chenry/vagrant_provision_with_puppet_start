exec { "apt-get update":
	path => "/usr/bin",
}

package { "apache2":
	ensure => present,
	require => Exec["apt-get update"],
}

package { "ssh":
	ensure => present,
	require => Exec["apt-get update"],
}

package { "rsync":
	ensure => present,
	require => Exec["apt-get update"],
}

package { "vim":
	ensure => present,
	require => Exec["apt-get update"],
}

service { "apache2":
	ensure => "running",
	require => Package["apache2"],
}

file { "/var/www/sample-webapp":
	ensure => "link",
	target => "/vagrant/sample-webapp",
	require => Package["apache2"],
	notify => Service["apache2"],
}

include java
include wget

$hadoop_dir_structure = ["/etc/hadoop", "/etc/hadoop/2.7.1"]
file { $hadoop_dir_structure:
	ensure => "directory",
	owner => "root",
	mode => 750,
}

#wget::fetch { "Hadoop 2.7.1 Tarball":
#	source =>'http://apache.go-parts.com/hadoop/common/hadoop-2.7.1/hadoop-2.7.1.tar.gz',
	#destination => '/etc/hadoop/2.7.1',
	#require => File["/etc/hadoop/2.7.1"],
#}
