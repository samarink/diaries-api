Diary.destroy_all
Note.destroy_all

(1..2).each do |i|
  diary = Diary.create(title: "public diary N.#{i}", kind: 'public')

  (1..3).each do |j|
    diary.notes.create(text: "text of the note N.#{j} for diary N.#{i}")
  end
end

(1..2).each do |i|
  diary = Diary.create(title: "private diary N.#{i}", kind: 'private', expiration: 10.minutes.from_now)

  (1..3).each do |j|
    diary.notes.create(text: "text of the note N.#{j} for diary N.#{i}")
  end
end
