class AddCategoryIdToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :category_id, :integer
  end
end
