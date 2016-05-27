class UserMailer < ActionMailer::Base
	default from: "sammydallal@gmail.com"



	def sample_email(user)
	    @user = user
	    mail(to: @user.email, subject: 'Sample Email')
  	end
		

end