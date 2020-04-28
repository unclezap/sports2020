class AddBatchIdToWeekResults < ActiveRecord::Migration[6.0]
  def change
    add_column :week_results, :batch_id, :integer
  end
end
