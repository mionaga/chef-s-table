class ApplicationController < ActionController::Base
  before_action except: [:top, :about, :index, :show] do
    authenticate_end_user! unless current_admin
  end
end
