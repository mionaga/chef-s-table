class Public::EndUsersController < ApplicationController
  def show
    @end_user = EndUser.find(params[:id])
    hide_sensitive_information unless current_user == @end_user
  end

  def edit
  end

  def index
    
  end

  def check
  end
  
  private

  def hide_sensitive_information
    @end_user.email = nil
    @end_user.family_name = nil
    @end_user.first_name = nil
  end
end
