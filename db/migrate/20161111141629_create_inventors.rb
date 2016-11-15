class CreateInventors < ActiveRecord::Migration
  def change
    create_table :inventors do |t|
      t.string :name
      t.string :about
      t.timestamps
    end
  end
end
