class UsersController < ApplicationController

  def index

  end

  def new
    @user = User.new
  end

  def create
    return if param[:user_id]
    @user = User.new(user_params)
    if @user.save
      { user_id: @user.id }
      #@user.send_activation_email
      #flash[:info] = "Please check your email to activate your account."
      #redirect_to root_url
    else
      render 'new'
    end
  end

  def show

  end

  def update_messages
    return unless param[:user_id]
    @user = User.find(param[:user_id])
    return unless @user
    @user.update_messages(params)
  end

  def spam_messages
    return unless param[:user_id]
    @user = User.find(param[:user_id])
    return unless @user
    @user.spam_messages
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number,
                                 :address)
  end

end
