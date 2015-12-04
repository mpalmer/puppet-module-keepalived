define keepalived::vrrp_script(
		$server,
		$script,
		$interval = 5,
		$weight   = undef,
		$fall     = undef,
		$rise     = undef,
) {
	bitfile::bit { "keepalived.conf:${server}:vrrp_script:${name}":
		path    => "/etc/keepalived/keepalived.conf",
		ordinal => 10,
		content => template("keepalived/vrrp_script"),
	}
}
