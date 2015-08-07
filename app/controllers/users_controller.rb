class UsersController < ApplicationController
  def show
    @user = User.find params[:id]
    @form_user = FormUser.find params[:id]
    @sort = params[:type]
    @recent_addresses = @user.addresses.order("created_at DESC") 
    @addresses = if @sort.blank?
      @user.addresses.page params[:page]
    else
      @user.addresses.order_by_colunm(@sort["type"]).page params[:page]
    end
  end
end
