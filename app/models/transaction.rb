class Transaction < ApplicationRecord
  belongs_to :wallet

  enum :status, {pending: 0, completed: 1}
  enum :coin_type, {bitcoin: 0, ethereum: 1, "usd" => 2, "bank" => 3}

  enum :transaction_type, {deposit: 0, withdrawal: 1}
end
