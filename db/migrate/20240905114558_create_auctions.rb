class CreateAuctions < ActiveRecord::Migration[7.2]
  def change
    create_table :auctions do |t|
      t.string :title
      t.text :description
      t.decimal :starting_price
      t.decimal :current_price

      t.timestamps
    end
  end
end
