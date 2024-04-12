class Trigger < ApplicationRecord
    after_create :update_interest 


    private 

    def update_interest
        AddInterestInstructionJob.perfom_now

    end

end
