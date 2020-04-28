class AddWeekResultIdToWeekResults < ActiveRecord::Migration[6.0]
  def change
    add_column :week_results, :week_result_id, :integer
  end
end
