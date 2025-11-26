class RenameViewsToTotalViewsInArticles < ActiveRecord::Migration[6.1]
  def change
    rename_column :articles, :views, :total_views
  end
end
