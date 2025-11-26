class ChangeTotalViewsTypeInArticles < ActiveRecord::Migration[6.1]
  def change
    change_column :articles, :total_views, :decimal, precision: 9, scale: 2, default: 0.0
  end
end
