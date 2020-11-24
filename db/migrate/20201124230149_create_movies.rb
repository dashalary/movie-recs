class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :release_year
      t.string :genre
      t.integer :user_id
    end
  end
end
