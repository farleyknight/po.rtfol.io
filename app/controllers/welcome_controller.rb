class WelcomeController < ApplicationController
  def index
    render action: "index", controller: "posts"
  end
end
