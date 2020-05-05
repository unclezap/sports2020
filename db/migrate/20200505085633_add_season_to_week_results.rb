class AddSeasonToWeekResults < ActiveRecord::Migration[6.0]
  def change
    add_column :week_results, :season, :string
  end
end
