#
# Cookbook Name:: cookbook_databox
# Recipe:: mysql
#
# Install MySQL and create specified databases and users.
#

root_password = node["cookbook_databox"]["db_root_password"]

# Install the MySQL service
mysql_service 'default' do
  initial_root_password root_password
  action [:create, :start]
end

# Install the MySQL Client
mysql_client 'default' do
  action :create
end

# Include the database recipes for MySQL
include_recipe "database::mysql"

# Loop through each database that we are to add
node["cookbook_databox"]["databases"]["mysql"].each do |entry|

  # Retrieve the database host if set, otherwise use 127.0.0.1
  database_host = '127.0.0.1'
  if entry["host"]
    database_host = entry["host"]
  end
  
  # Set the connection information dictionary
  mysql_connection_info = {
    :host => database_host,
    :username => 'root',
    :password => root_password
  }

  # Create the database
  mysql_database entry["database_name"] do
    connection mysql_connection_info
    encoding entry["encoding"] if entry["encoding"]
    collation entry["collation"] if entry["collation"]
    action :create
  end

  # Create the database user
  mysql_database_user entry["username"] do
    connection mysql_connection_info
    action [:create, :grant]
    password(entry["password"])           if entry["password"]
    database_name(entry["database_name"]) if entry["database_name"]
    privileges(entry["privileges"])       if entry["privileges"]
    host(database_host)                   if database_host
    table(entry["table"])                 if entry["table"]
  end

end
