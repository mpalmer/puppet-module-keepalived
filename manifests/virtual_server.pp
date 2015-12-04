define keepalived::virtual_server(
	$server,
	$address      = undef,
	$port         = undef,
	$fwmark       = undef,
	$protocol     = "TCP",
	$delay_loop   = 5,
	$algorithm    = "rr",
	$forwarding   = "DR",
	$ha_suspend   = false,
	$virtualhost  = undef,
	$sorry_server = undef,
) {
	bitfile::bit { "keepalived.conf:virtual_server:${name}":
		path            => "/etc/keepalived/keepalived.conf",
		ordinal         => 60,
		content         => template("keepalived/virtual_server"),
		closing_content => "}\n"
	}
}
