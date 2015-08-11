require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

# we're telling datamapper to use a postgres database on localhost. The name will be "bookmark_manager_test" or "bookmark_manager_development" depending on the environment
DataMapper.setup(:default, "postgres://hauccacvalwdnx:6mgwM2mn_C2Tun-0OLDbd8MRKZ@ec2-54-197-230-210.compute-1.amazonaws.com:5432/db9rpq4us34l37" || "postgres://localhost/bookmark_manager_#{env}")

require './app/models/link' # require each model individually - the path may vary depending on your file structure.

# After declaring your models, you should finalise them
DataMapper.finalize

# However, the database tables don't exist yet. Let's tell datamapper to create them
DataMapper.auto_upgrade!