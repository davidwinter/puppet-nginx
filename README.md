# puppet-nginx

This puppet module aims to be lightweight and help you get an `nginx` virtual host up and running quickly. It was developed with `vagrant` in mind so that I could get a web environment up and running in as few lines as possible.

If you're looking for `php-fpm` functionallity too, check out my other module, [phpfpm](https://github.com/davidwinter/puppet-phpfpm), which includes a resource for adding virtual hosts to nginx.

## Install

With librarian-puppet, add the following to your Puppetfile:

	mod 'postfix',
		:git => 'git://github.com/davidwinter/puppet-nginx.git'

Then run `librarian-puppet install`.

## Usage

	nginx::vhost { 'your.domain.com':
	  root => '/path/to/docroot',
	}

That's it! If you was expecting more, this module probably isn't for you. Though, there are a few options:

	nginx::vhost { 'my site':
	  ensure      => present,
	  root        => '/var/www',
	  priority    => '3',
	  file        => 'my-site',
	  server_name => 'my.site.com',
	  index       => 'index.html',
	  template    => 'myconfig/mysite.conf.erb',
	}

The `nginx` class can also be configured:

	class { 'nginx':
	  ensure        => present,
	  default_vhost => false,
	}

## Author

David Winter <i@djw.me>

## Licence

MIT
