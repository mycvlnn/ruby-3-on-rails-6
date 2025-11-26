class RemovePublishedAtFromArticles < ActiveRecord::Migration[6.1]
  def change
    remove_column :articles, :published_at, :datetime
  end
end
