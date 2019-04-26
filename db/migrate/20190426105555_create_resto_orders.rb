class CreateRestoOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :resto_orders do |t|
      t.string :resto_name
      t.integer :amount_cents

      t.timestamps
    end
  end
end
