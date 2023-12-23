class ApplicationController < ActionController::Base
  before_action :authenticate_admin!, if: :admin_url
  
  before_action except: [:top, :about, :index, :show] do
    authenticate_end_user! unless current_admin
  end
  
  def admin_url
    request.fullpath.include?("/admi")
  end  

  def after_sign_in_path_for(resource)
    if resource.is_a?(EndUser)
      root_path # ユーザーはトップページにリダイレクト
    elsif resource.is_a?(Admin)
      admin_end_users_path # 管理者はend_users/indexにリダイレクト
    else
      super
    end
  end
end
