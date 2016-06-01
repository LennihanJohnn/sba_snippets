class CommentsMailer < ApplicationMailer
  def create(comment)
    @comment = comment
    @snippet = @comment.snippet
    mail to: @snippet.user.email, subject: "Reply to #{@snippet.title}"
  end
end
