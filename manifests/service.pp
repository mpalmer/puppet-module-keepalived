class keepalived::service {
	service { "keepalived":
		ensure => running,
		enable => true,
	}
}
