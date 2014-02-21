require 'mongo'

conn = Mongo::Connection.new
db = conn['tutorial']
coll = db['users']

puts coll.find.first.inspect
