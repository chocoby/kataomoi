$:.unshift(File.expand_path('lib', File.dirname(__FILE__)))

require 'kataomoi'

task :friends do
  Kataomoi::Users.fetch(:friend)
end

task :followers do
  Kataomoi::Users.fetch(:follower)
end

task :diff do
  Kataomoi::Diff.run
end
