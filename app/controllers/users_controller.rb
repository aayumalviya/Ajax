class UsersController < ApplicationController
  def index
    @users = User.all 
  end

  def show 
    @user = User.find(params[:id])
  end  

  def new 
    @user = User.new 
  end 

  def create 

    @user = User.new(user_params)

    if @user.save 
      respond_to do |format|
        format.js { }
        end
    else 
      render :new , status: :unprocessable_entity 
    end 
  end 

  def edit 
    @user = User.find(params[:id])
  end 

  def update 

    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user 
    else 
      render :edit , unprocessable_entity
    end  
  end 

  def destroy 
    @user = User.find(params[:id])
    @user.destroy 
       respond_to do |format|
        format.html{redirect_to root_path, status: :see_other} 
        format.js { }
        end
    
  end

 

  private 
  def user_params 
    params.require(:user).permit(:name , :content)
  end 
end
