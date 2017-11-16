class AddColumnToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :is_published, :boolean
  end
end
