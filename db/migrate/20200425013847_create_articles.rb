class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :article_text
      t.string :article_url

      t.timestamps
    end
  end
end
