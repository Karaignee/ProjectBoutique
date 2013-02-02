class ApplicationController < ActionController::Base

  def forem_user
    UsersHelper
  end
  helper_method :forem_user


  def forem_user
    current_user
  end
  helper_method :forem_user


  protect_from_forgery

  protected
# Returns the currently logged in user or nil if there isn't one
  def current_user
    return unless session[:user_id]
    @current_user ||= User.find_by_id(session[:user_id])
  end
# Make current_user available in templates as a helper
  helper_method :current_user
# Filter method to enforce a login requirement
# Apply as a before_filter on any controller you want to protect
  def authenticate
    logged_in? ? true : access_denied
  end
# Predicate method to test for a logged in user
  def logged_in?
    current_user.is_a? User
  end
# Make logged_in? available in templates as a helper
  helper_method :logged_in?
  def access_denied
    redirect_to home_path, :notice => "Please log in to continue"
    return false

  end

  private
  
  helper_method :current_cart
  def current_cart
    @current_cart ||= Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    @current_cart ||= cart
    end
end
