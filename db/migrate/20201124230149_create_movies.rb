class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :release_year
      t.boolean :seen
      t.integer :user_id
      t.integer :category_id
    end
  end
end
