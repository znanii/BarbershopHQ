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

class Contacts < ActiveRecord::Base
	validates :name, presence: true, length: {minimum: 3}
	validates :phone, presence: true
	validates :email, presence: true
end

before do 
	@barbers = Barber.all
end

get '/' do
	erb :index			
end

get '/contacts' do	
	@co = Contacts.new	
	erb :contacts
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

	Client.create   :name =>@username, 
			:phone=>@phone, 
			:datestamp=>@datetime,
			:barber=>@barber,
			:color=>@color
		erb "<h2>Thank you</h2>"
end

post '/contacts' do
	
	@co =Contacts.new params[:contact]
	if @co.save
  erb "<h2>We will contact you soon</h2>"
  	else
  		@error = @co.errors.full_messages.first
  		erb :contacts
  	end
end


get "/barber/:id" do
	@barber = Barber.find(params[:id])
	erb :barber
end	

get '/bookings' do
	@clients = Client.order('created_at DESC')
	erb :clients
end

get '/client/:id' do
	@client = Client.find(params[:id])
	erb :client
end



