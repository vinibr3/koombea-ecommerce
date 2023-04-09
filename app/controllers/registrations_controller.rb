# frozen_string_literal

class RegistrationsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @user = User.new
  end

  def create
    @user = User.new(valid_params)

    if @user.save
      sign_in(@user)
      redirect_to products_path
    else
      flash.now[:alert] = @user.errors.full_messages.join(', ')
      render :new, status: :unprocessable_entity
    end
  end

  private

  def valid_params
    params.require(:user).permit(:email, :password)
  end
end
