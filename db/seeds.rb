(1..10).each do |id|
  Enquete.create({
    title: "Enquete.#{id}",
    description: 'This is a survey for...',
    status: %i[published draft][id % 2],
    start_at: Date.new(2023, 10, 1),
    end_at: Date.new(2023, 11, 1)
   })
  (1..5).each do |qid|
    Question.create({
      enquete_id: id,
      text: "Question.#{id}-#{qid}",
      format: rand(1..4),
      required: false,
    })
  end
end
