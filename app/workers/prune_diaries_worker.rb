class PruneDiariesWorker
  include Sidekiq::Worker

  def perform
    Diary.where(:expiration <= Time.new).destroy_all
  end
end
