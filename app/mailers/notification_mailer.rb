class NotificationMailer < ApplicationMailer
  default from: 'service@ama-china.org‍'
  def notify_mentor(ama, comment)
    @comment = comment
    @ama = ama
    subject = "您在 AMA China 有新的提问"
    delivery_options = {user_name: config['url'], password: config["password"], :address => "smtp.mxhichina.com", :port => '25', :authentication => :plain}
    mail(:from => "AMAChina<#{config['url']}>", to: ama.mentor.email, subject: subject, delivery_method_options: delivery_options)
  end

  private
  def config
    YAML.load(ERB.new(File.read("#{Rails.root}/config/email.yml")).result)
  end
end
