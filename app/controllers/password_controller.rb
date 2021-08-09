class PasswordController < ApplicationController
  def reset
    token = request.query_parametrs['token'] or params['token'] or not_found
    user = User.find_by_reset(token) or not_found
    if params['password']
      @user.password = params['password']
      @user.save
      render plain: "successfully"
    end
    render plain: token
  end

  def forgot
    if params['email']
      if user
        user = User.find_by_email(params['email']) 
        token = secureRabdom.hex(10)
        user.reset = token
        user.save
        ResetMailer.with(user: @user).reset_password
      end
      render plain: "A linke to reset a your password "
    end
  end
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
