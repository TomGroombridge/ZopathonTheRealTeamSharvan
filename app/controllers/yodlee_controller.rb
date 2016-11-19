class YodleeController < ApplicationController

  def show
  	@user = User.find(params[:])
  end

end
