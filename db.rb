#!/usr/bin/env ruby
require 'rubygems'
require 'trollop'
require 'mysql2'

opts = Trollop::options do
  opt :user, 'User who has rights to do things (root)', :default => 'root', :type => :string
  opt :password, 'The password of the user with rights', :type => :string
  opt :userToCreate, 'User you want to create', :type => :string
  opt :passwordToCreate, 'Password of the user you want to create', :default => 'password', :type => :string
  opt :database, 'Database to create', :type => :string
end

Trollop::die :user, 'Username required' if opts[:user].nil?
Trollop::die :userToCreate, 'New username required' if opts[:userToCreate].nil?
Trollop::die :passwordToCreate, 'New password required' if opts[:passwordToCreate].nil?
Trollop::die :database, 'Database required' if opts[:database].nil?

opts[:password].nil? ?
    client = Mysql2::Client.new(:host => 'localhost', :username => opts[:user]) :
    client = Mysql2::Client.new(:host => 'localhost', :username => opts[:user], :password => opts[:password])

client.query("create database #{opts[:database]};")
client.query("create user '#{opts[:userToCreate]}'@'localhost' identified by '#{opts[:passwordToCreate]}';")
client.query("GRANT ALL PRIVILEGES ON #{opts[:database]}.* TO '#{opts[:userToCreate]}'@'localhost';")

client.close()