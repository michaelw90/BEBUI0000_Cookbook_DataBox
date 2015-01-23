default["cookbook_databox"]["db_root_password"] = nil

# A list of database_user's attribute parameters.
# See database cookbook for details.
default["cookbook_databox"]["databases"] = {}
default["cookbook_databox"]["databases"]["mysql"] = []
default["cookbook_databox"]["databases"]["postgresql"] = []

# This is currently set until the database cookbook updates itself to not have this problem
# against the latest mysql cookbook.
set['mysql']['version'] = '5.6'