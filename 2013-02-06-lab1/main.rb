require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development? # view changes in real-time without manually restarting Sinatra.

#HTTP REQUEST
get '/hello'  do
  'I am a master hacker ninja!!!!'
end

get '/' do
  'This is my awesome home page!'
end

get '/calc' do
  @first = params[:first].to_f
  @second = params[:second].to_f
  @operator = params[:operator]
  @result = case params[:operator]
  when "+" then @first + @second
  when "*" then @first * @second
  when "-" then @first - @second
  when "/" then @first / @second
  end
  erb :calc
end


# get "/name/:first/:last/:age" do
#   "Your name is-> #{params[:first]} #{params[:last]} and #{params[:age]}. "
# end

# get "/calc/multiply/:x/:y" do
#   # variables passed to erb files must be
#   # instance variables
#   @result = params[:x].to_f * params[:y].to_f
#   @action = "times"
#   #erb file, #erb filename in symbol
#   erb :calc
# end

# get "/calc/add/:x/:y" do
#   @result = params[:x].to_f + params[:y].to_f
#   @action = "plus"
#   #erb file, #erb filename in symbol
#   erb :calc
# end

get "/calc/:act/:x/:y" do
  @action = params[:act]
  case @action
  when "multiply" then @result = params[:x].to_f * params[:y].to_f
  when "add" then @result = params[:x].to_f + params[:y].to_f
  end
  "#{@result}"
  #erb :calc
end


# get "/calculate/:action/:num1/:num2" do
#   num1 = params[:num1]
#   num2 = params[:num2]
#   action = params[:action]
#   result = calculate(action, num1, num2)
#   "#{num1} #{action} #{num2} equals #{result}"
# end


# def calculate(action, num1, num2)
#   output = 0
#   case action
#     when "add" then output = num+num2
#     when "subtract" then output = num1-num2
#     when "multiply" then output = num*num2
#     when "divide" then output = num / num2
#   output
#   end
# end