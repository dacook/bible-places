require 'rubygems'
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require 'sinatra/redirect_with_flash'
require './config/application'
require './config/environments' #database configuration
# require './models/user'
require 'haml'
# require 'sass'
# require "net/http"
# require "uri"
# require 'date'
require 'pry' #REM
require './app/models/place_ref.rb'
require './app/models/place.rb'
require './app/models/book.rb'
require './lib/bible/reference.rb'

enable :sessions

require './app/helpers/esv_helper.rb'
get '/' do

  bible = ESV.new(settings.esv_key || 'IP')
  @bible_passage = bible.doPassageQuery(params[:passage])

  @bible_passage

  haml :index
end

post '/submit' do
  @user = User.new(params[:user])
  if @user.save
    redirect '/users', :notice => "User '#{@user.name}' created."
  else
    redirect '/', error: 'Invalid, please try again'
  end
end

get '/users' do
  @title = "Users"
  @users = User.all
  erb :users
end

helpers do
  def title
    if @title
      "#{@title}"
    else
      "Welcome"
    end
  end
end