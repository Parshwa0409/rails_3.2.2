class ContactController < ApplicationController
    def index
        flash.now[:notice] = "You are currently @ 'contact-us/index' route."
    end
end
