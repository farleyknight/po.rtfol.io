require 'wordpress'
require 'tumblr'

class PostsController < ApplicationController
  layout false

  def show
    @post = Post.find(params[:id])
  end

  def index
    render json: {
      html: render_to_string(action: "index", controller: "posts")
    }
  end
end
