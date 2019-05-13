class CreatePickPacks < ActiveRecord::Migration[5.2]
  def change
    create_table :pick_packs do |t|

      t.timestamps
    end
  end
end
