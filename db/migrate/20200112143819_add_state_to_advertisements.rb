class AddStateToAdvertisements < ActiveRecord::Migration[6.0]
  def change
    add_column :advertisements, :state, :string
  end
end
