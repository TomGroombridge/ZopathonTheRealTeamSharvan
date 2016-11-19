class WelcomeController < ApplicationController

  def index
  	@loan = LoanApplication.new
  end

end
