class kibana ($version="1.8.1", $elasticsearch_url="127.0.0.1:9200") {

   include kibana::packages	
   include kibana::config

   Class['kibana::packages']->Class['kibana::config']	

}
