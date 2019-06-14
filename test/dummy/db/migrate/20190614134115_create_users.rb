class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
    	t.string :name
    	t.string :eye_color
    	t.integer :city_id
    end
  end
end
