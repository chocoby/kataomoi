module Kataomoi
  class Followers
    class << self
      def get_follower_ids
        Mongo.db.coll(:follower).find.map { |user| user['id'] }
      end
    end
  end
end
