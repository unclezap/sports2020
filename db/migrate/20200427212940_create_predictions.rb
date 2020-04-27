class CreatePredictions < ActiveRecord::Migration[6.0]
  def change
    create_table :predictions do |t|
      t.string :team_a
      t.string :team_b
      t.integer :team_a_score
      t.integer :team_b_score

      t.timestamps
    end
  end
end
