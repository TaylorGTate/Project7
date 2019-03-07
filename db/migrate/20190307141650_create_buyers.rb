class CreateBuyers < ActiveRecord::Migration[5.2]
  def change
    create_table :buyers do |t|
      t.string :name
      t.string :address
      t.string :pay_type

      t.timestamps
    end
  end
end
