class CreateDairies < ActiveRecord::Migration[6.0]
  def change
    create_table :dairies do |t|

      t.timestamps
    end
  end
end
