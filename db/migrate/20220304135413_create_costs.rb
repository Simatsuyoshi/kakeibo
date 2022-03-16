class CreateCosts < ActiveRecord::Migration[6.1]
  def change
    create_table :costs do |t|
      t.date :date
      t.string :content
      t.bigint :cost, null: false
      t.references :user, null: false, foreign_key: true
      t.references :category, foreign_key: true
      t.references :kind, foreign_key: true

      t.timestamps
    end
  end
end
