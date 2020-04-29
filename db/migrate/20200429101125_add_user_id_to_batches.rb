class AddUserIdToBatches < ActiveRecord::Migration[6.0]
  def change
    add_column :batches, :user_id, :integer
  end
end
