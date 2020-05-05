class AddYearToWeekResults < ActiveRecord::Migration[6.0]
  def change
    add_column :week_results, :year, :integer
  end
end
