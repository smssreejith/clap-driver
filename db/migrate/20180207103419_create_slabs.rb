class CreateSlabs < ActiveRecord::Migration[5.1]
  def change
    create_table :slabs do |t|
      t.string :name
      t.string :slab_1_from
      t.string :slab_1_to
      t.decimal :slab_1_amount
      t.string :slab_2_from
      t.string :slab_2_to
      t.decimal :slab_2_amount
      t.string :slab_3_from
      t.string :slab_3_to
      t.decimal :slab_3_amount
      t.string :slab_4_from
      t.string :slab_4_to
      t.decimal :slab_4_amount
      t.string :slab_5_from
      t.string :slab_5_to
      t.decimal :slab_5_amount

      t.timestamps
    end
  end
end
