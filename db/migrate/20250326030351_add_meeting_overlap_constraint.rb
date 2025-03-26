class AddMeetingOverlapConstraint < ActiveRecord::Migration[7.0]
  def change
    execute <<-SQL
      ALTER TABLE meetings
      ADD CONSTRAINT no_overlapping_meetings
      EXCLUDE USING GIST (
        int8range(extract(EPOCH FROM start_time)::bigint, extract(EPOCH FROM end_time)::bigint) WITH &&
      )
    SQL
  end
end
