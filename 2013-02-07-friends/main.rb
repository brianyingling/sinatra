require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'active_support/all'
require_relative 'friend'


# Home page
get '/' do
  erb :home
end

# Shows the new friend form
get '/new' do
  erb :new
end

# Posts new information to the db query
post '/new' do
  friend = Friend.new(params)
  friend.save
  redirect to '/list'
end

# list all of the friends
get '/list' do
  @rows = Friend.list
  erb :list
end


