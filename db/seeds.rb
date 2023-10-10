(1..10).each do |id|
  Enquete.create({
    title: "Enquete.#{id}",
    description: 'This is a survey for...',
    status: [:published, :draft][id % 2],
    start_at: Date.new(2023, 10, 1),
    end_at: Date.new(2023, 11, 1)
  })
end
