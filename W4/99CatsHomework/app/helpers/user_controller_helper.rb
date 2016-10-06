module UserControllerHelper
  def create
    @user = User.new(user_params)
    if @user.save
      login_user!(@user)

      msg = UserMailer.welcome_email(@user)
      msg.deliver

      redirect_to @url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def new
    @user = User.new
    render :new
  end

  private
  def user_params
    params.require(:user).permit(:password, :username)
  end
end