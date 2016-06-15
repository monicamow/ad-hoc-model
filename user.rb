# Based on http://www.jonathanleighton.com/articles/2011/awesome-active-record-bug-reports/ 

# Run this script with `$ ruby my_script.rb`
require 'sqlite3'
require 'active_record'

# Use `binding.pry` anywhere in this script for easy debugging
require 'pry'

# Connect to an in-memory sqlite3 database
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'user_test.db'
)

# Define a minimal database schema
ActiveRecord::Schema.define do
  create_table :users, force: true do |t|
    t.string :first_name
    t.string :last_name
    t.string :email
    t.string :username
    t.string :password_digest
  end
end

class User < ActiveRecord::Base
  has_secure_password
end

# Create a few records...
User.create(first_name: "Monica", last_name: "Geller", email: "mgeller@gmail.com", username: "monica", password: "coco123", password_confirmation: "coco123")