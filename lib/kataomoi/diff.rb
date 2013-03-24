module Kataomoi
  class Diff
    class << self
      def run
        db = Mongo.db

        friend_ids = Kataomoi::Friends.get_friend_ids
        follower_ids = Kataomoi::Followers.get_follower_ids

        puts "friend: #{friend_ids.count}"
        puts "follower: #{follower_ids.count}"

        diff_coll = db.coll(:diff)
        diff_coll.remove

        diff = []
        friend_ids.each do |user_id|
          unless follower_ids.include?(user_id)
            diff << user_id
            diff_coll.insert({ id: user_id })
          end
        end

        puts "kataomoi: #{diff.count}"
        puts "end!"
      end

      def get_diff_ids
        Mongo.db.coll(:diff).find.map { |user| user['id'] }
      end
    end
  end
end
