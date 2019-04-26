class CreateMealVoucherCredits < ActiveRecord::Migration[5.2]
  def change
    create_table :meal_voucher_credits do |t|
      t.string :company_name
      t.integer :amount_cents

      t.timestamps
    end
  end
end
