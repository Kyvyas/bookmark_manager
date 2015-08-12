require 'sinatra/base'
require './data_mapper_setup'


class BookmarkManager < Sinatra::Base

  set :views, proc { File.join(root, '..', 'views') }

  enable :sessions
  set :session_secret, 'super secret'

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
    link = Link.new(url: params[:url],     
                title: params[:title])
    params[:tags].split(" ").each do |t|
      tag  = Tag.create(name: t) 
      link.tags << tag  
    end                   
    link.save 
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    User.create(email: params[:email],
                password: params[:password])
    redirect to('/links')
  end

  post '/users' do
    user = User.create(email: params[:email],
                       password: params[:password])
    session[:user_id] = user.id
    redirect to('/')
  end

  helpers do
    def current_user
      User.get(session[:user_id])
    end
  end


end
