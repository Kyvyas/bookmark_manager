require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require 'sinatra/partial'

require_relative 'controllers/base.rb'
require_relative 'controllers/application.rb'
require_relative 'controllers/link.rb'
require_relative 'controllers/session.rb'
require_relative 'controllers/user.rb'

module Armadillo

  class BookmarkManager < Sinatra::Base

    use Routes::AppRoute
    use Routes::LinkRoute
    use Routes::UserRoute
    use Routes::SessionRoute
    
    run! if app_file == $0
  end
end
