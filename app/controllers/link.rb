require_relative './base.rb'
require_relative './../data_mapper_setup'

module Armadillo
  module Routes
    class Link < Base

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

    end
  end
end