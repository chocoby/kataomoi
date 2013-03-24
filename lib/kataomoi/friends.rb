module Kataomoi
  class Friends
    class << self
      def get_friend_ids
        Mongo.db.coll(:friend).find.map { |user| user['id'] }
      end
    end
  end
end
