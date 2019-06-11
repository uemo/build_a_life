class UsersController < ApplicationController
before_action :authenticate_user!
  # before_action :admin_user, except: [:show, :edit, :update, :destroy]

  def index
     @users = User.page(params[:page]).per(10).reverse_order
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
    if @user.id == current_user.id
    # elsif current_user.admin?
    else
        redirect_to edit_user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = '会員情報が更新されました。'
      redirect_to user_path(@user.id)
    else
        flash[:danger] = '必要項目を入力してください。'
        render :edit
    end
  end

  # def destroy
  #   @user = User.find(params[:id])
  #   @user.destroy
  #   if current_user.admin?
  #     redirect_to users_path
  #   else
  #     flash[:notice] = '退会しました。ご利用ありがとうございました。'
  #     redirect_to root_path
  #   end
  # end

  private
    def user_params
      params.require(:user).permit(:email,
      	                           :name,
      	                           :ruby_name,
      	                           :hundle_name,
      	                           :phone,
      	                           :user_image,
      	                           :birthday,
      	                           :address,
      	                           :introduction,
      	                           :goal)
    end
end
