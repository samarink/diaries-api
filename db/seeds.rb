Diary.destroy_all
Note.destroy_all

NUM_PUBLIC_DIARIES = 2
NUM_PRIVATE_DIARIES = 2
NUM_NOTES_FOR_PUBLIC_DIARIES = 3
NUM_NOTES_FOR_PRIVATE_DIARIES = 3

# Create public diaries
(1..NUM_PUBLIC_DIARIES).each do |i|
  diary = Diary.create(
    title: "public diary N.#{i}",
    kind: 'public'
  )

  # Create notes for each diary
  (1..NUM_NOTES_FOR_PUBLIC_DIARIES).each do |j|
    diary.notes.create(text: "text of the note N.#{j} for public diary N.#{i}")
  end
end

# Create private diaries
(1..NUM_PRIVATE_DIARIES).each do |i|
  diary = Diary.create(
    title: "private diary N.#{i}",
    kind: 'private',
    expiration: 10.minutes.from_now
  )

  # Create notes for each diary
  (1..NUM_NOTES_FOR_PRIVATE_DIARIES).each do |j|
    diary.notes.create(text: "text of the note N.#{j} for private diary N.#{i}")
  end
end
