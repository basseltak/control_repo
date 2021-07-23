class profile::ssh_server {
  package {'openssh-server':
    ensure => present,
  }
  service { 'sshd':
    ensure => 'running',
    enable => 'true',
  }
  ssh_authorized_key { 'root@master.puppet.vm':
    ensure => present,
    user => 'root',
    type => 'ssh-rsa',
    key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC+5A16FhwpsGQbgt4qLsWvETXX7+3xkRCEFCmKcNsLnkUsyTx9AFx16nvJ479lnTWuh5xtNdn6mchY9OyBw0pancH68NqjANnIP7qXjun7gpjIVlRsj2n2CLHilxmAK3rbAIfaLdk3oJEM5dbK3uZYUaMavmAg8i71j//HYHnsJQ8iK+Mi5Zv/gnfNgKi7ByEsJ/q2BC3uPfFQn9ujbG0dIyS/L2+ia133liBzNYi3O8DoD43HTl/ll1zpw3HbUoH7jZzCqI2A0veWaIzaC6lFer3ue8IuTgkltOqb9v6jD8ciVq3oFskMTvq1IIqmhFRuCl7vEtscTdqutDfGIMUl',
  }
}
