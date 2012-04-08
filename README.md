This puppet module aims to be lightweight and help you get an nginx virtual host up and running quickly. It was developed with Vagrant in mind so that I could get a web environment up and running in as few lines as possible.

## How to use

Clone this into your modules directory. Then in your manifests file, add the following:

	include nginx

	nginx::vhost { 'vhost_name':
		server_name => 'your.domain.com',
		root		=> '/path/to/docroot',
	}

That's it! If you was expecting more, this module probably isn't for you.

## PHP-fpm

If you're looking for php-fpm functionallity too, check out my other module, [phpfpm](https://github.com/davidwinter/puppet-phpfpm), which includes a resource for adding virtual hosts to nginx.

## Contribute

Please feel free to submit pull requests for any other basic functionallity you think this module should include.