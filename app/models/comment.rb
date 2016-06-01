class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :snippet

  validates_presence_of :text, :snippet, :user

  after_create :send_reply_email, unless: :author_commented?
  def send_reply_email
    Resque.enqueue(CommentsMailerWorker, id)
  end

  def author_commented?
    user == snippet.user
  end
end
