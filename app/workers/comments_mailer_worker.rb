class CommentsMailerWorker
  @queue = :comments_mailer_queue

  def self.perform(comment_id)
    comment = Comment.find(comment_id)
    CommentsMailer.create(comment).deliver_now!
  end

end
