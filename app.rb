#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "barbershop.db"}

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end
before do 
	@barbers = Barber.all
end

get '/' do
	erb :index			
end

get '/blabla' do
	
	erb 'BLABLA'
end

get '/visit' do
	erb :visit 
end

post '/visit' do
	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@barber = params[:barber]
	@color = params[:color]

	Client.create   :name => "#{@username}", 
			:phone=>"#{@phone}", 
			:datestamp=>"#{@datetime}",
			:barber=>"#{@barber}",
			:color=>"#{@color}"

	erb "<h2>Thank you</h2>"
end