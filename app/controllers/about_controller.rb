class AboutController < ApplicationController
  def index
    flash.now[:notice] = "You are currently @ 'about/index' route."
  end
end
