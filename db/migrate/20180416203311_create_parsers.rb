class CreateParsers < ActiveRecord::Migration[5.2]
  def change
    create_table :parsers do |t|

      t.timestamps
    end
  end
end
