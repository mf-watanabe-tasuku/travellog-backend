class DropEyecatchTable < ActiveRecord::Migration[6.1]
  def up
    drop_table :eyecatches
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
