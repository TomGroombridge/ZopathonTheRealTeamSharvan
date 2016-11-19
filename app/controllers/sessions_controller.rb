class SessionsController < ApplicationController

  def new
    redirect_to '/auth/amazon'
  end

  def create
    auth = request.env["omniauth.auth"]
    @user = User.where(:provider => auth['provider'],
                      :uid => auth['uid'].to_s).first || User.create_with_omniauth(auth)
    reset_session
    session[:user_id] = @user.id
    @user.email = request.env["omniauth.auth"].dig(:info, :email)
    @user.postal_code = request.env["omniauth.auth"].dig(:extra, :postal_code)

    @address_response = PostcodeFinder.new(@user.postal_code).call

    build_address(@address_response)

    redirect_to yodlee_path, :notice => 'Signed in!'
  end

  def destroy
    reset_session
    redirect_to root_url, :notice => 'Signed out!'
  end

  def failure
    redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end

  private

  def build_address address_response
    @address = @user.addresses.build
    @address.update_attributes(
      post_code: address_response["postcode"],
      county: address_response["region"],
      district: address_response["admin_district"],
      house_name: "Cool club",
      house_number: "145",
      street_1: "Zopa street",
      street_2: "Zopa bank street"
      )
    @address.save
  end

end
