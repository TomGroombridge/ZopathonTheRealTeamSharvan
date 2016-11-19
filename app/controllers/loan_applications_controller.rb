class LoanApplicationsController < ApplicationController

	def create
		@loan_application = LoanApplication.new(loan_application_params)

		save_into_session loan_amount, loan_term

    unless @loan_application.valid?
    	redirect_to welcome_index_path and return
    end

    redirect_to new_about_you_path
	end

	private

	def loan_application_params
		params.require(:loan_application).permit!
	end

	def save_into_session loan_amount, loan_term
    session[:loan_amount] = loan_amount
    session[:loan_term] = loan_term
  end

  def loan_amount
    loan_application_params[:loan_amount].to_f
  end

  def loan_term
    loan_application_params[:loan_term].to_f
  end
end
