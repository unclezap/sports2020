class AddDateToWeekResults < ActiveRecord::Migration[6.0]
  def change
    add_column :week_results, :day, :datetime
  end
end
