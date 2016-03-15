## Rails Lite

A MVC web application framework built from scratch in Ruby as inspired by Rails. Applications are mounted in local servers using WEBrick.

## Usage
* Clone this repository
* In terminal, run `bundle install` to install gems
* Run `ruby bin/server.rb` to test working server
* Open `localhost:3000` in browser to see rendered view

## Features

### ControllerBase
`ControllerBase` class contains all core functionalities to handle web browser requests. All other controllers inherit from `ControllerBase`, allowing maintainability of controller configurations through a single class.

A sample controller could look like this:

```ruby
class Controller < ControllerBase
  def index
    render_content("Welcome to Yian's Rails Lite Page!", "text/html")
  end
end
```

Core functionalities include:
* updates HTTP header of browser responses, including fields such as `status` and `location`
* executes any action defined in controller on request
* `redirect_to` another action or `render` the specified HTML ERB view template upon completion of action
* avoids and handles double rendering by checking `already_built_response?`
* handles all parameters, whether they come from the browser request or the router
* calls `session` class to handle session cookies


### Router & Routing
`Route` class handles browser requests and determines the appropriate controller and action to instantiate and invoke.

Routes are instantiated by the `Router` class which in turn implements RESTful routing through metaprogramming:

```ruby
[:get, :post, :put, :delete].each do |http_method|
  define_method(http_method) do |pattern, controller_class, action_name|
    add_route(pattern, http_method, controller_class, action_name)
  end
end
```

### Session
`Session` class allows persistence of objects between browser requests. This is useful for objects that don't change much and are needed all the time, such as a Session Token object for a system that requires login.

Sample usages of session could look like this:

```ruby
#setting new session cookie
session[:session_token] = User.session_token

#removing :session_token from session
session[:session_token] = nil
```

### Flash
`Flash` class stores and renders flash and flash.now cookies. Flash cookies are not persisted and is thus useful for objects that are only temporarily relevant, such as error-messages.

## Todos
* Add error handler middleware
* Add CSRF tokens
