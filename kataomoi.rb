$:.unshift(File.expand_path('lib', File.dirname(__FILE__)))

require 'sinatra'
require 'haml'
require 'kataomoi'

set :haml, format: :html5

get '/' do
  haml :index
end

get '/users' do
  user_ids = Kataomoi::Diff.get_diff_ids

  @users = Kataomoi::Mongo.db.coll(:friend).find({ 'id' => { '$in' => user_ids }})

  haml :users
end

get '/kataomoi.js' do
  coffee :kataomoi
end
