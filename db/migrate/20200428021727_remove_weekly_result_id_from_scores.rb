class RemoveWeeklyResultIdFromScores < ActiveRecord::Migration[6.0]
  def change

    remove_column :scores, :weekly_result_id, :integer
  end
end
