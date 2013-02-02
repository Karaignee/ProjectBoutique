class CreateVouchers < ActiveRecord::Migration
  def change
    create_table :vouchers do |t|
      t.string :name
      t.decimal :amount
      t.string :voucher_id

      t.timestamps
    end
  end
end
