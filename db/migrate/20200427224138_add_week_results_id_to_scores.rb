class AddWeekResultsIdToScores < ActiveRecord::Migration[6.0]
  def change
    add_column :scores, :weekly_result_id, :integer
  end
end
