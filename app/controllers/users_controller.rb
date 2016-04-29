class UsersController < ApplicationController
  
  before_action :set_user, only: [:edit, :update, :destroy]

  def show 
   @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  #追加しました。by suzuki
  def edit
  end
  
  #追加しました。by suzuki
  def update
    if @user.update(user_params)
      #保存に成功した場合はトップページへリダイレクト
      render 'show' , notice: 'メッセージを編集しました'
    else
      #保存に失敗した場合は編集画面に戻す
      render 'edit'
    end
  end  

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :address, :profile,
                                 :password_confirmation)
  end

  def set_user
     @user = User.find(params[:id])
  end

end