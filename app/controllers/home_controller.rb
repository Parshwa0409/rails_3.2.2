class HomeController < ApplicationController
  def index
    flash.now[:notice] = "You are currently @ 'home/index' route."
  end
end
