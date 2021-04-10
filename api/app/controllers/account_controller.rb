class AccountController < ApplicationController

  def login
    account = Account.find_by(account_params)

    render json: { message: account != nil ? "Access granted" : "Invalid credentials" , status: account != nil }
  end

  private 
    def account_params
      params.require(:account).permit(:username, :password)
    end
end
