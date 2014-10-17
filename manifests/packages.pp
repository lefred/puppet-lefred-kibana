class kibana::packages {

   $version = $kibana::version 

   exec {
	"install_kibana":
		exec    => "curl https://download.elasticsearch.org/kibana/kibana/kibana-${version}.tar.gz | tar zx",
		path    => ["/usr/bin", "/bin" ],
		cwd     => "/usr/share/",
		unless  => "ls /usr/share/kibana-${version} 2>/dev/null",
   }

   file {
      '/usr/share/kibana':
        ensure    => link,
        target    => "/usr/share/kibana-${version}",
        require   => [ Exec['install_kibana'], Class['elasticsearch'] ] ,
   }

}
