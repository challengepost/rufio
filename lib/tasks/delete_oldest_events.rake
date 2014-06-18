desc "Delete all but the most recent events"
task delete_oldest_events: :environment do
  # currently using db plan with 10K row limit overall
  EVENT_TABLE_ROW_LIMIT = 5_000
  limit = Event.count - EVENT_TABLE_ROW_LIMIT
  if limit > 0
    ids = Event.reorder('created_at ASC').limit(limit).pluck(:id)
    Event.where(id: ids).delete_all
  end
end
