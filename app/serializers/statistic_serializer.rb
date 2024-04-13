class StatisticSerializer < ActiveModel::Serializer
  attributes :id, :totalProfit, :totalUsers, :totalDeposits, :totalWithdrawal
end
