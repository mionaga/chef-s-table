class ApplicationController < ActionController::Base
  before_action except: [:top, :about, :index] do 
    authenticate_end_user! unless current_admin
  end 

  
end
