define keepalived::vrrp_instance(
		$server,
		$virtual_router_id,
		$interface,
		$priority,
		$initial_master      = true,
		$track_interfaces    = [],
		$virtual_ipaddresses = [],
		$virtual_routes      = [],
		$track_scripts       = [],
		$smtp_alert          = false,
		$notify_master       = undef,
		$notify_slave        = undef,
		$notify_fault        = undef,
		$notify_all          = undef,
) {
	bitfile::bit { "keepalived.conf:${server}:vrrp_instance:${name}":
		path    => "/etc/keepalived/keepalived.conf",
		ordinal => 20,
		content => template("keepalived/vrrp_instance"),
	}
}
