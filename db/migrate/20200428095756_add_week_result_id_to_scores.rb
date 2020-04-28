class AddWeekResultIdToScores < ActiveRecord::Migration[6.0]
  def change
    add_column :scores, :week_result_id, :integer
  end
end
