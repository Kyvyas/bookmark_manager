require_relative './base.rb'

module Armadillo
  module Routes
    class AppRoute < Base

      
    get '/' do
      "Hello Bookmark Manager"
    end

    end
  end
end