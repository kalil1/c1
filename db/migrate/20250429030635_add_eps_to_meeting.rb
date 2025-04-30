class AddEpsToMeeting < ActiveRecord::Migration[7.0]
  def change
    add_column :meetings, :ep, :json
  end
end
