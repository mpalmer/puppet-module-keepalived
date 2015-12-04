define keepalived::real_server(
		$virtual_server,
		$address,
		$port,
		$weight                       = 1,
		$inhibit_on_failure           = false,
		$notify_up                    = undef,
		$notify_down                  = undef,
		$health_check                 = "TCP_CHECK",
		$health_check_port            = undef,
		$health_check_bindto          = undef,
		$health_check_connect_timeout = undef,
		$health_check_url_path        = undef,
		$health_check_url_digest      = undef,
		$health_check_url_status_code = undef,
		$health_check_retries         = undef,
		$health_check_retry_delay     = undef,
		$health_check_script          = undef,
		$health_check_script_dynamic  = false,
) {
	bitfile::bit { "keepalived:virtual_server:${virtual_server}:real_server:${name}":
		path    => "/etc/keepalived/keepalived.conf",
		parent  => "keepalived.conf:virtual_server:${virtual_server}",
		content => template("keepalived/real_server"),
	}
}
