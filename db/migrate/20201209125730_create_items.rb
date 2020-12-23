class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string      :name
      t.text        :explanation
      t.integer     :category_id
      t.integer     :status_id
      t.integer     :fee_burden_id
      t.integer     :prefecture_id
      t.integer     :day_required_id
      t.integer     :price
      t.references  :user
      t.timestamps
    end
  end
end
