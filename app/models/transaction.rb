class Transaction < ApplicationRecord
  belongs_to :wallet

  enum :status, {pending: 0, completed: 1}
  enum :coin_type, {bitcoin: 0, ethereum: 1, "usd" => 2, "bank" => 3}

  enum :transaction_type, {deposit: 0, withdrawal: 1}

  before_create :valid_transaction?
  

  def valid_transaction?
    
    raise ActiveRecord::RecordNotSaved, "You have limited funds in your wallet"  unless amount < wallet.wallet_balance || transaction_type == "deposit"

    true
    
  end
end