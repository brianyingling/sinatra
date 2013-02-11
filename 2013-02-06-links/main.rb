require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  erb :home
end

# Redirects to another page.
post '/navigate' do
  case params[:destination].downcase
  when 'sports'     then redirect to ('/sports')
  when 'weather'    then redirect to ('/weather')
  when 'celebrity'  then redirect to ('/celebrity')
  when 'gossip'     then redirect to ('/gossip')
  else
    redirect to ('/')
  end
end

get '/sports' do
  erb :sports
end

get '/weather' do
  erb :weather
end

get '/celebrity' do
  erb :celebrity
end

get '/gossip' do
  erb :gossip
end

