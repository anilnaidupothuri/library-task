# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]
  before_action :check_owner, only: [:update, :destroy]
  def show
    render json: @user
  end

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.create(user_params)

    if @user.save
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
        render json: @user
      else
        byebug
        render json: {status: "error", code: 3000, message: "Can't find purchases without start and end date"}
    end
  end

  def destroy
    @user.destroy
    head :no_content
  end

  private

  def user_params
    params.permit(:name, :email, :password, :admin)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def check_owner
    head :forbidden unless @user.id == current_user.id 
  end
end
