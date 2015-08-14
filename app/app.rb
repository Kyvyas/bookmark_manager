require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require 'sinatra/partial'

require_relative 'controllers/base.rb'
require_relative 'controllers/link.rb'
require_relative 'controllers/session.rb'
require_relative 'controllers/user.rb'

module Armadillo

  class BookmarkManager < Sinatra::Base

    use Routes::LinkRoute
    use Routes::UserRoute
    use Routes::SessionRoute

    # set :views, proc { File.join(root, '..', 'views') }

    # enable :sessions
    # set :session_secret, 'super secret'
    # register Sinatra::Flash
    # register Sinatra::Partial

    # set :partial_template_engine, :erb

    # use Rack::MethodOverride

    get '/' do
      "Hello Bookmark Manager"
    end

    # get '/links' do
    #   @links = Link.all
    #   erb :'links/index'
    # end

    # get '/links/new' do
    #   erb :'links/form'
    # end

    # post '/links' do
    #   link = Link.new(url: params[:url],     
    #               title: params[:title])
    #   params[:tags].split(" ").each do |t|
    #     tag  = Tag.create(name: t) 
    #     link.tags << tag  
    #   end                   
    #   link.save 
    #   redirect '/links'
    # end

    # get '/tags/:name' do
    #   tag = Tag.first(name: params[:name])
    #   @links = tag ? tag.links : []
    #   erb :'links/index'
    # end

    # get '/users/new' do
    #   @user = User.new
    #   erb :'users/new'
    # end

    # post '/users' do
    #   @user = User.new(email: params[:email],
    #                   password: params[:password],
    #                   password_confirmation: params[:password_confirmation])
    #   if @user.save
    #     session[:user_id] = @user.id
    #     redirect to('/links')
    #   else
    #     flash.now[:errors] = @user.errors.full_messages
    #     erb :'users/new'
    #   end
    # end

    # get '/sessions/new' do
    #   erb :'sessions/new'
    # end

    # post '/sessions' do
    #   user = User.authenticate(params[:email], params[:password])
    #   if user
    #     session[:user_id] = user.id
    #     redirect to('/links')
    #   else
    #     flash.now[:errors] = ['The email or password is incorrect']
    #     erb :'sessions/new'
    #   end
    # end

    # delete '/sessions' do
    #   session.clear
    #   flash[:notice] = ['goodbye!']
    # end

    
    run! if app_file == $0
  end
end
