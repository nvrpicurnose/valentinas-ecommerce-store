if Rails.env != 'test'
  email_settings = YAML::load(File.open("#{Rails.root.to_s}/config/email.yml"))
  ActionMailer::Base.smtp_settings = email_settings[Rails.env] unless email_settings[Rails.env].nil?
end

ActionMailer::Base.smtp_settings = {
	:address 	=> "smtp.gmail.com",
	:port 		=> 587,
	:user_name	=> "noreply.valentinas@gmail.com",
	:password	=> "riosdenim",
	:authentication	=> "plain",
	:enable_starttls_auto	=> true
}
