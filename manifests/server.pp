define keepalived::server(
		$notification_email_to   = [],
		$notification_email_from = undef,
		$smtp_server             = undef,
		$smtp_connect_timeout    = undef,
) {
	include keepalived::packages
	include keepalived::service

	bitfile { "/etc/keepalived/keepalived.conf":
		owner  => "root",
		group  => "root",
		mode   => "0440",
		notify => Service["keepalived"],
	}

	bitfile::bit {
		"keepalived.conf:${name}:header":
			path    => "/etc/keepalived/keepalived.conf",
			ordinal => 0,
			content => "# THIS FILE IS PUPPET MANAGED\n# DO NOT MODIFY\n";
		"keepalived.conf:${name}:global_opts":
			path    => "/etc/keepalived/keepalived.conf",
			ordinal => 1,
			content => template("keepalived/global_defs");
	}
}
