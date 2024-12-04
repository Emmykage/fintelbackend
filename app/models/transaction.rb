class Transaction < ApplicationRecord
  belongs_to :wallet
  has_one_attached :proof
  has_one :user, through: :wallet

  enum :status, {pending: 0, approved: 1, declined: 2}
  enum :coin_type, {bitcoin: 0, ethereum: 1, "usd" => 2, "bank" => 3}

  enum :transaction_type, {deposit: 0, withdrawal: 1}

  before_create :valid_transaction?


  def proof_url
    Rails.application.routes.url_helpers.url_for(proof) if proof.attached?
  end


  def valid_transaction?

    raise ActiveRecord::RecordNotSaved, "You have limited funds in your wallet"  unless amount < wallet.wallet_balance || transaction_type == "deposit"

    true

  end
end