name             "cookbook_databox"
maintainer       "Fred Thompson"
maintainer_email "fred.thompson@buildempire.co.uk"
license          "Apache License 2.0"
description      "Setup a database server that runs multiple MySQL and PostgreSQL databases."
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.5"

recipe            "cookbook_databox", "Includes all recipes."
recipe            "cookbook_databox::mysql", "Install MySQL and create MySQL databases."
recipe            "cookbook_databox::postgresql", "Install PostgreSQL and create PostgreSQL databases."

supports "ubuntu"
supports "debian"

depends "database"
depends "mysql"
depends "postgresql"
depends "mysql2_chef_gem"
