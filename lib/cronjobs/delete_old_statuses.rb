class DeleteOldStatuses 
  status_ids = Status.all(:conditions => ["created_at < ?", 24.hours.ago])

  if status_ids.size > 0
    Status.destroy(status_ids)
    puts "#{status_ids.size} statuses have been deleted!"
  else
    puts "No statuses have been deleted."
  end

end