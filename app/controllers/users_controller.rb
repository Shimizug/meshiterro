class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # 特定の投稿者に結びついた投稿をすべて取得しインスタンス変数に代入
    @post_images = @user.post_images
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)  
  end
    
      private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
