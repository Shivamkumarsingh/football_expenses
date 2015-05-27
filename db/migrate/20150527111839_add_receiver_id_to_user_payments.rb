class AddReceiverIdToUserPayments < ActiveRecord::Migration
  def change
    add_column :user_payments, :receiver_id, :integer
  end
end
