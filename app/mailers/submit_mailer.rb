class SubmitMailer < ApplicationMailer
	default :from=>"noreply.valentinas@gmail.com"

	def submit_thanks(submit)
		@submit = submit
		mail(:to=> submit.email, :subject=> "Hey #{submit.name}, thanks for your submission!")
	end

	def model_notice(model)
		@model = model
		mail(:to=>model.email, :subject=> "Hey #{model.name}, your photo has been featured!")
	end

end
