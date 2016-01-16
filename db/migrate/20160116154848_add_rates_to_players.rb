class AddRatesToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :rate, :integer
  end
end
