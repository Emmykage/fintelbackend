class Plan < ApplicationRecord
    has_many :portfolios

    enum :tenure, {weekly: 0, "bi weekly"=> 1, monthly: 2, quarterly: 3, biannually: 4}
end