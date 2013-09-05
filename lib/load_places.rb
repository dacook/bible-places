#lTODO: figure out rake tasks..
require 'rubygems'
require 'sinatra'
require 'sinatra/activerecord'
require 'pry'
require './config/application'
require './config/environments' #database configuration
require './app/models/place_ref.rb'
require './app/models/place.rb'
require './app/models/book.rb'
require './lib/openbible/load_places.rb'

OpenBible::load_places

exit