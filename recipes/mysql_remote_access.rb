
include_recipe "database"

mysql_connection_info = {
	:host => "localhost",
	:username => 'root',
	:password => node['mysql']['server_root_password']
}

# Make a dedicated localhost only user for it
mysql_database_user 'remote' do
	connection mysql_connection_info
	host node['chef-dsdev-database']['host_range']
	password node['mysql']['server_repl_password']
	privileges [:all]
	action [:create, :grant]
end
