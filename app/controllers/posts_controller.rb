require 'wordpress'
require 'tumblr'

class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end
end
