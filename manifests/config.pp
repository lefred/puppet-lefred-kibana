class kibana::config {

   $elasticsearch_url = $kibana::elasticsearch_url

   case $::osfamily {
	'RedHat': {
		$fileloc = "/etc/httpd/conf.d/kibana.conf" 
	}
	'Debian': {
		$fileloc = "/etc/apache2/sites-enabled/kibana.conf"
	}
   }  


   file {
	$fileloc:
		ensure  => present,
		source  => "puppet:///modules/kibana/kibana.conf";
   }
}

