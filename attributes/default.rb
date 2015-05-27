default["cookbook_databox"]["db_root_password"] = nil

# A list of database_user's attribute parameters.
# See database cookbook for details.
default["cookbook_databox"]["databases"] = {}
default["cookbook_databox"]["databases"]["mysql"] = nil
default["cookbook_databox"]["databases"]["postgresql"] = nil

default["cookbook_databox"]["mysql_version"] = "5.6"

default["cookbook_databox"]["mysql_configuration_template"] = 'default.cnf.erb'
default["cookbook_databox"]["mysql_configuration_cookbook"] = 'cookbook_databox'

