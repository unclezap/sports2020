class CreateWeekResults < ActiveRecord::Migration[6.0]
  def change
    create_table :week_results do |t|
      t.string :results_text
      t.string :results_url
      t.integer :week

      t.timestamps
    end
  end
end
