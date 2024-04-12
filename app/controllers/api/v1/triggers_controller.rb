class Api::V1::TriggersController < ApplicationController
  before_action :authorize
  def update
  end

  def create

    @trigger = Trigger.new

    if @trigger.save? 
      render json: @trigger, status: :created

    else
      render json: @trigger.errors, status: :unprocessable_entity

    end

  end
  # def trigger_params
  #   params.require(:trigger).permit()
    
  # end

end
