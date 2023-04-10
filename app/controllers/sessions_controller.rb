# frozen_string_literal: true

class SessionsController < EcommerceController
  skip_before_action :authenticate_user!

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(valid_params[:email])
                .try(:authenticate, valid_params[:password])

    if @user
      sign_in(@user)
      redirect_to products_path
    else
      flash.now[:alert] = t('.unauthenticated')
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    sign_out
    redirect_to new_session_path
  end

  private

  def valid_params
    params.require(:user).permit(:email, :password)
  end
end
