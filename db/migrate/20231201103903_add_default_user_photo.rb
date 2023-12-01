class AddDefaultUserPhoto < ActiveRecord::Migration[7.1]
  def change
    change_column_default :users, :photo, from: nil, to: "https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  end
end
