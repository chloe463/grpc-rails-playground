(1..10).each do |id|
  enquete = Enquete.create({
    title: "Enquete.#{id}",
    description: 'This is a survey for...',
    status: %i[published draft][id % 2],
    start_at: Date.new(2023, 10, 1),
    end_at: Date.new(2023, 11, 1),
    author_id: id,
   })
  (1..5).each do |qid|
    question = Question.create({
      enquete_id: enquete.id,
      text: "Question.#{enquete.id}-#{qid}",
      format: rand(1..4),
      required: false,
    })

    (1..4).each do |oid|
      Option.create({
        question_id: question.id,
        text: "Option.#{enquete.id}-#{question.id}-#{oid}",
      })
    end
  end
end

[
  'Luke Skywalker',
  'Darth Vader',
  'Leia Organa',
  'Han Solo',
  'Obi Wan Kenobi',
  'Chewbacca',
  'Yoda',
  'R2D2',
  'C3PO',
  'Boba Fett',
].freeze.each do |name|
    User.create({
      name:
    })
  end

