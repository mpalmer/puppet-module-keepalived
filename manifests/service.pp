class keepalived::service {
	service { "keepalived":
		enable => true,
	}
}
