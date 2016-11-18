class AddCodeColumns < ActiveRecord::Migration
  def change
		add_column :algorithms, :Python, :text
		add_column :algorithms, :Java, :text	
		add_column :algorithms, :Cpp, :text	
		add_column :algorithms, :Ruby, :text	
  end
end
