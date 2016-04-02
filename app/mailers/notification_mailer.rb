class NotificationMailer < ApplicationMailer
  def notify_mentor(ama, comment)
    @comment = comment
    @ama = ama
    subject = "您在 AMA China 有新的提问"
    delivery_options = {:address => "smtp.mxhichina.com", :port => '25', :authentication => :plain}
    mail(:from => "AMAChina<#{EMAIL['url']}>", to: ama.mentor.email, subject: subject, delivery_method_options: delivery_options)
  end
end
