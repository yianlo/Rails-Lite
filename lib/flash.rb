require 'json'

class Flash
  def initialize(req)
    cookie = req.cookies["_rails_lite_app_flash"]

    @flash_now = Hash.new
    @flash_data = Hash.new

    JSON.parse(cookie).each{ |key, val| @flash_now[key] = val } if cookie
  end

  def now
   @flash_now
  end

  def [](key)
    @flash_now[key.to_s] || @flash_data[key.to_s]
  end

  def []=(key, val)
    @flash_now[key.to_s] = val
    @flash_data[key.to_s] = val
  end

  def store_flash(res)
    res.set_cookie("_rails_lite_app_flash", @flash_data)
  end
end
