class CreateParserRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :parser_records do |t|
      t.string :link, unique: true
      t.string :header
      t.string :content
      t.string :img_tag
      t.string :img
      t.references :parser, foreign_key: true

      t.timestamps
    end
  end
end
