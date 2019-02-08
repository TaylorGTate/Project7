class AddPopularityToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :popularity, :decimal, default: 0
  end
end
