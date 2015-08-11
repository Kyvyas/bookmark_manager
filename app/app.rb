require 'sinatra/base'
require './app/models/link'
require './data_mapper_setup'


class BookmarkManager < Sinatra::Base

  set :views, proc { File.join(root, '..', 'views') }

  get '/' do
    "Hello Bookmark Manager"
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/form'
  end

  post '/links' do
    Link.create(url: params[:url], title: params[:title])
    redirect '/links'
  end



end
