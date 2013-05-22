
include_recipe "database"

postgresql_connection_info = {
	:host => "localhost",
	:port => node['postgresql']['config']['port'],
	:username => 'postgres',
	:password => node['postgresql']['password']['postgres']
}

# Make a dedicated localhost only user for it
postgresql_database_user 'remote' do
	connection postgresql_connection_info
	host node['chef-dsdev-database']['host_range']
	password node['postgresql']['password']['postgres']
	privileges [:all]
	action [:create, :grant]
end
