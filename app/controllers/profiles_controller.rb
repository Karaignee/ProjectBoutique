class ProfilesController < ApplicationController
  def show
    @user = current_user
      if current_user
        @orders = Order.all
        render action: :show
      else
        render file: 'public/404',    status: 404, formats: [:html]
      end
  end
end


