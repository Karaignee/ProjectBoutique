class HomeController < ApplicationController

  def index
    #retrieving all products and displaying 2. change this later to display new items only with Products.find whatever
    #home page will also link to forum recent posts
    @products=Product.all[0..1]
    @user=current_user


  end

end

