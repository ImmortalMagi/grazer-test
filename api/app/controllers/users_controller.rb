class UsersController < ApplicationController
  def index
    render :json => User.all
  end

  def show
    render :json => User.find(params[:id])
  end

  def search
    render :json => User.find_by(user_params)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render :json => @user
    else
      render :json => ["Error With Values"], status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      render :json => @user
    else
      render :json => ["Error With Values"], status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    render :json => ["Deleted"]
  end

  private
    def user_params
      params.expect(user: [:name, :gender, :locationX, :locationY, :diet_type, :age])
    end
end
