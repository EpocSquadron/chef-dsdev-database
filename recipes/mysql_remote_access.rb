
include_recipe "mysql::server"

mysql_connection_info = {
	:host => "localhost",
	:username => 'root',
	:password => node['mysql']['server_root_password']
}

# Make a dedicated localhost only user for it
mysql_database_user 'repl' do
	connection mysql_connection_info
	host '%'
	action [:grant]
end
