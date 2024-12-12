class UsersController < ApplicationController
  def index
    render :json => User.all
  end

  def show
    render :json => User.find(params[:id])
  end

  def create
    #@user = User.new(name: params[:name], gender: params[:gender], locationX: params[:locationX], locationY: params[:locationY], diet_type: params[:diet_type], age: params[:age])
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

    render :json => []
  end

  private
    def user_params
      params.expect(user: [:name, :gender, :locationX, :locationY, :diet_type, :age])
    end
end
