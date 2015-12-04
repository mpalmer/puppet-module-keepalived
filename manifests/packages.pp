class keepalived::packages {
	noop { "keepalived/packages/installed": }

	case $::operatingsystem {
		Debian,Ubuntu: {
			$keepalived_package = "keepalived"
		}
		default: {
			fail("Unknown \$::operatingsystem '${::operatingsystem}; please improve keepalived::packages")
		}
	}

	package { $keepalived_package:
		before => Noop["keepalived/packages/installed"];
	}
}
