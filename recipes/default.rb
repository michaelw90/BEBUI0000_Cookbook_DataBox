#
# Cookbook Name:: cookbook_databox
# Recipe:: default
#
#

if node["cookbook_databox"]["databases"]["mysql"]
  include_recipe "cookbook_databox::mysql"
end

if node["cookbook_databox"]["databases"]["postgresql"]
  include_recipe "cookbook_databox::postgresql"
end
