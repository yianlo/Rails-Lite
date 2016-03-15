require 'json'

class Session
  def initialize(req)
    cookie = req.cookies["_rails_lite_app"]
    @cookie_data = cookie ? JSON.parse(cookie) : {}
  end

  def [](key)
    @cookie_data[key]
  end

  def []=(key, val)
    @cookie_data[key] = val
  end

  def store_session(res)
    cookie = { path: '/', value: @cookie_data.to_json }
    res.set_cookie("_rails_lite_app", cookie)
  end
end
