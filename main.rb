require 'pry'
require 'nokogiri'
require 'open-uri'
require 'sinatra'

# controllers
require './controllers/scrap'

get '/' do
  erb :index
end