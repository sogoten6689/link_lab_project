module AdminHelper

  def is_signed_in?
    if !user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
