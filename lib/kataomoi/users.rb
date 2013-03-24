module Kataomoi
  class Users
    class << self
      def fetch(type)
        case type
        when :friend, :follower
          method = "#{type}_ids"
        else
          raise "Unknown type"
        end

        type_coll = Mongo.db.coll(type)
        type_coll.remove

        user_ids = Twitter.send(method)
        user_ids = user_ids.ids

        users = []

        user_ids.each_slice(100) do |ids|
          response = Twitter.users(ids)

          response.each do |user|
            puts "[#{Time.now.strftime('%Y-%m-%d %H:%M:%S')}] insert: #{user.screen_name}"

            user_hash = user.attrs
            user_hash.delete(:status)
            user_hash[:last_tweeted_at] = (user.status) ? user.status.created_at : false

            type_coll.insert user_hash
            users << user_hash
          end
        end

        puts "count: #{users.count}"
        puts 'end!'
      end
    end
  end
end
