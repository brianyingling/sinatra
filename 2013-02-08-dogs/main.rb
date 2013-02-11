require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'active_support/all'
require 'pg'

# executes before any other actions in this file.
# instance variables in this block are available in the
# running command below.
before do
  # go to the database, select out all of the breeds
  @nav_rows = run_sql("select distinct breed from dogs")
end


get '/' do
  erb :home
end

# form to create a new dog
get '/new' do
  erb :new
end


post '/dogs/:dog_id' do
  sql = "update dogs set name='#{params['name']}', photo = '#{params['photo']}', breed='#{params['breed']}' where id = '#{params['dog_id']}'"
  run_sql(sql)
  redirect to ('/dogs')
end


get '/dogs/:dog_id/edit' do
  sql = "select * from dogs where id=#{params['dog_id']}"
  rows = run_sql(sql)
  @row = rows.first      #only expecting 1 result
  erb :new
end

get '/dogs' do
  sql = "select * from dogs"
  @rows = run_sql(sql)
  erb :dogs
end

# show all the breeds on one page.
get '/dogs/:breed' do
  sql = "select * from dogs where breed='#{params['breed']}'"
  @rows = run_sql(sql)
  erb :dogs
end

# insert a dog from the form into the db
post '/create' do
  run_sql("insert into dogs (name, breed, photo) values ('#{@params['name']}', '#{@params['breed']}', '#{@params['photo']}')")
  redirect to ('/dogs')
end

# deletes a dog
post '/dogs/:dog_id/delete' do
  run_sql("delete from dogs where id=#{params['dog_id']}")
  redirect to ('/dogs')
end

def run_sql(sql)
  conn = PG.connect(:dbname=>'dog_db',:host=>'localhost')
  result = conn.exec(sql)
  conn.close
  result
end