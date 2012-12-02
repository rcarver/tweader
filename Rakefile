load "Rakefile.base"

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs.push "lib", "test"
  t.test_files = FileList['test/**/*_test.rb']
  t.verbose = true
end

desc "Get a Twitter Access Token for posting tweets"
task :authorize_twitter do
  require 'twitter_oauth'

  client = TwitterOAuth::Client.new(
    :consumer_key => ENV['TW_CONSUMER_KEY'],
    :consumer_secret => ENV['TW_CONSUMER_SECRET']
  )

  request_token = client.authentication_request_token(
    :oauth_callback => 'oob'
  )

  puts request_token.authorize_url

  print 'Please visit the URL and enter the code: '
  code = STDIN.gets.strip

  access_token = client.authorize(
    request_token.token,
    request_token.secret,
    :oauth_verifier => code
  )

  puts "export TW_OAUTH_TOKEN=#{access_token.token}"
  puts "export TW_OAUTH_SECRET=#{access_token.secret}"
end
