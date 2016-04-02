ActionMailer::Base.smtp_settings = {
  :address        => "smtp.mxhichina.com", # default: localhost
  :port           => '25',                  # default: 25
  :authentication => :plain                 # :plain, :login or :cram_md5
}
