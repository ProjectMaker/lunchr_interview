class CreateCardPayments < ActiveRecord::Migration[5.2]
  def change
    create_table :card_payments do |t|
      t.string :merchant_name
      t.integer :amount_cents

      t.timestamps
    end
  end
end
