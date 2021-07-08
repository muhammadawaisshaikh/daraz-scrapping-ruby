require 'pry'
require 'nokogiri'
require 'open-uri'
require 'sinatra'

# controllers
require './controllers/scrap'
require './controllers/daraz'

get '/' do
  erb :index
end