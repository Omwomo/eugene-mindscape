class HomeController < ApplicationController
  def index
    # Action to handle the base URL (https://)
    @welcome_message = 'Welcome to Eugenes Mindscape Blog!'
  end
end
