class CreateContacts < ActiveRecord::Migration[7.1]
  def change
  		create_table :contacts do |t|
  			t.text :name
  			t.text :phone
  			t.text :email

  			t.timestamps
  		end
  end
end
