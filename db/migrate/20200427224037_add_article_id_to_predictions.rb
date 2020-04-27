class AddArticleIdToPredictions < ActiveRecord::Migration[6.0]
  def change
    add_column :predictions, :article_id, :integer
  end
end
