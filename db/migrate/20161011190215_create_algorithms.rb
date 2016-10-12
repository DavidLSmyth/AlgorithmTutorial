class CreateAlgorithms < ActiveRecord::Migration
  def change
    create_table :algorithms do |t|
      t.string :name
	  t.string :purpose
      t.text :description
      t.string :link
      t.text :pseudoCode
      t.text :complexityAnalysis
      t.integer :difficulty
      t.string :author
      t.timestamps
    end
  end
end
