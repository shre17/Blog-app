class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, notice: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end

  #  def after_sign_in_path_for(resource) 
  #    new_article_path
  # end

  def after_sign_in_path_for(resource)
    if resource.role == 'admin'
      new_admins_article_path
    elsif resource.role == 'author'
       new_article_path
     else
       articles_path
    end
  end

end
