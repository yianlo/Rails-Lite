require 'rack'
require 'erb'

require_relative '../lib/controller_base'
require_relative '../lib/router'

class Controller < ControllerBase
  def index
    render_content("Welcome to Yian's Rails Lite Page!", "text/html")
  end
end

router = Router.new
router.draw do
  get Regexp.new("^/$"), Controller, :index
end

app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new
  router.run(req, res)
  res.finish
end

Rack::Server.start(
 app: app,
 Port: 3000
)
