class AddInterestInstructionJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    PortfolioInterest.all.each do |interest|

      interest.update_interest
    end
  end
end
