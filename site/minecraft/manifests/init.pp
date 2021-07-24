class minecraft {
  	file {'/opt/minecraft':
    		ensure => directory,
    	}
  	file {'/opt/minecraft/server.jar':
    		ensure => file,
    		source => 'https://launcher.mojang.com/v1/objects/a16d67e5807f57fc4e550299cf20226194497dc2/server.jar',
		before => Service['minecraft'],
    	}
	package {'java':
		ensure => present,
	}
	file {'/opt/minecraft/eula.txt':
		ensure => file,
		content => 'eula=true',
	}
	file {'/etc/systemd/system/minecraft.service':
		ensure => file,
		source => 'puppet:///modules/minecraft/minecraft.service'
	}
	service {'minecraft':
		ensure => running,
		enable => true,
		require => [Package['java'],File['/opt/minecraft/eula.txt'],File['/etc/systemd/system/minecraft.service']],
	}
}
