class AddStreamToStudent < ActiveRecord::Migration
  def change
    add_reference :students, :stream, index: true
  end
end
