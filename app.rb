require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'pry'

require_relative 'models/contact'

before do
  contact_attributes = [
    { first_name: 'Eric', last_name: 'Kelly', phone_number: '1234567890' },
    { first_name: 'Adam', last_name: 'Sheehan', phone_number: '1234567890' },
    { first_name: 'Dan', last_name: 'Pickett', phone_number: '1234567890' },
    { first_name: 'Evan', last_name: 'Charles', phone_number: '1234567890' },
    { first_name: 'Faizaan', last_name: 'Shamsi', phone_number: '1234567890' },
    { first_name: 'Helen', last_name: 'Hood', phone_number: '1234567890' },
    { first_name: 'Corinne', last_name: 'Babel', phone_number: '1234567890' }
  ]

  @contacts = contact_attributes.map do |attr|
    Contact.new(attr)
  end
end


def length
  (Contact.all.length.to_f / 3).ceil
end

get '/' do
  redirect '/contacts'
end

get '/contacts' do
  page_num = params[:page] ||= 1

  if params[:search] == nil
    @contacts = Contact.limit(3).offset((page_num.to_i * 3 ) - 3)
  else
    search = "%#{params[:search].gsub(' ','')}%"
    @contacts = Contact.limit(3).offset((page_num.to_i * 3 ) - 3).where("CONCAT(first_name, last_name) ilike :search ", { search: search })
  end
  erb :index
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id])
  erb :show
end
