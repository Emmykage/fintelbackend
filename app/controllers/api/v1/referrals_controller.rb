class Api::V1::ReferralsController < ApplicationController
    def show
      @referrer = User.find_by(referral_code: params[:code])
      if @referrer
        # You can store the referrer ID in the session or use it directly for tracking

        render json: @referral, status: :ok
      else
        # Handle the case where the referral code is invalid
        render json: {message: "Invalid referral code"}, status: :ok

        # redirect_to root_path, alert: 'Invalid referral code'
      end
    end
  end
