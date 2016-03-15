## Rails Lite

A MVC web application framework built from scratch in Ruby as inspired by Rails.

## Features
### ControllerBase
* Mounts local server using WEBrick
* ControllerBase class that redirects and renders HTML view templates

### Router & Routing
* Router class that handles browser requests and responses by instantiating a controller with router params and invoke the matched controller action

### Session & Flash
* Session class that stores and retrieves session cookies from browser
* Flash class that Stores and renders flash and flash.now cookies

## Usage
* Clone this repository
* In terminal, run `bundle install` to install gems
* Run `ruby bin/server.rb` to test working server
* Open `localhost:3000` in browser to see rendered view

## Code Highlights
