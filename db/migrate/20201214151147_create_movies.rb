class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :genre
      t.integer :year
      t.string :language
      t.string :plot
      t.string :poster
      t.string :rating
      t.string :director
      t.string :actors

      t.timestamps
    end
  end
end
