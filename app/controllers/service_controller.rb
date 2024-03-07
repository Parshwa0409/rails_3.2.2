class ServiceController < ApplicationController
  def index
    flash.now[:alert] = "ACCESS CONTROL: YOU ARE NOT ALLOWED HERE !!!!!"
  end
end
