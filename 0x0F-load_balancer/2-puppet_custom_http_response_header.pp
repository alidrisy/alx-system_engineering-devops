#Creating a custom HTTP header response

exec {'custom_HTTP':
	command => 'sed -i '26i\\tadd_header X-Served-By $hostname;' /etc/nginx/sites-available/default',
	provider => 'shell'
}
