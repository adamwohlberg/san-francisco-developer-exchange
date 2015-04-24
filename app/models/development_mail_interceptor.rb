class DevelopmentMailInterceptor
	def self.delivering_email(message)
		message.subject = "#{message.to} #{message.subject}" 
		message.to = ENV["ADMINISTRATOR_EMAIL"]
	end
end

