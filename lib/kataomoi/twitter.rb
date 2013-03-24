require 'twitter'
require 'yaml'

module Kataomoi
  class Twitter
    class << self
      def load_config
        YAML.load_file(File.expand_path('../../../config/twitter.yml', __FILE__))
      end

      def method_missing(method, *args)
        if ::Twitter.respond_to? method
          twitter_config = self.load_config

          ::Twitter.configure do |config|
            config.consumer_key = twitter_config["consumer_key"]
            config.consumer_secret = twitter_config["consumer_secret"]
            config.oauth_token = twitter_config["oauth_token"]
            config.oauth_token_secret = twitter_config["oauth_token_secret"]
          end

          ::Twitter.send(method, *args)
        else
          super
        end
      end
    end
  end
end
