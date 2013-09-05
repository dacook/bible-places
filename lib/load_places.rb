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
require './lib/bible/reference.rb'
require './lib/openbible/load_places.rb'

old_logger = ActiveRecord::Base.logger
ActiveRecord::Base.logger = nil

OpenBible::load_places

ActiveRecord::Base.logger = old_logger

exit