class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save

      session[:user_id] = @user.id
      session[:name] = @user.name
      #flash.notice = "Welcome  '#{@user.name}'!"
      redirect_to(articles_path)
    else
      @test = "TEEEEESTTT"
      render :new
    end

  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)

    redirect_to(root_path)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to(articles_path)
  end

  private
  def user_params
    params.require(:user).permit(:name)
  end
end
