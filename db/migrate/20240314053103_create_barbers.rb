class CreateBarbers < ActiveRecord::Migration[7.1]
  def change
	create_table :barbers do |t|
	  t.text :name

	t.timestamps
	end
	
	Barber.create :name => "Master1"
	Barber.create :name => "Masterok2"
	Barber.create :name => "Masteritsa3"	

  end
end
