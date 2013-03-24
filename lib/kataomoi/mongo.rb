require 'mongo'

module Kataomoi
  class Mongo
    class << self
      def db
        self.new
      end
    end

    attr_reader :db

    def initialize
      client = ::Mongo::MongoClient.new
      @db = client["kataomoi"]
    end

    def coll(name)
      @db[name]
    end
  end
end
