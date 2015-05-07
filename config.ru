require 'updater'

use Rack::Auth::Basic, 'Protected Area' do |user,pass|
  user == ENV['USERNAME'] && pass == ENV['PASSWORD']
end

run lambda { |env|
  SubspaceUpdater.new(Rack::Request.new(env)).update
  return [200, {}, ['']]
}
