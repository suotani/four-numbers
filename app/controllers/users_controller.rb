class UsersController < UserController

  def index
    @users = User.eager_load(:games)
    @users = @users.order(deposit: :desc) if params[:q].to_s == "deposit"
    @users = @users.order(win_count: :desc) if params[:q].to_s == "win"
  end

  def show
    @user = User.find(params[:id])
  end
end