class DecaMailer < ApplicationMailer
  def contact_email(options)
    @name = options[:name]
    @email = options[:email]
    @phone = options[:phone]
    @msg = options[:msg]
    mail(to: ENV['DECA_EMAIL_RECIPIENT'], subject: ENV['DECA_EMAIL_SUBJECT'], bcc: [ENV['DECA_EMAIL_BCC']])
  end
end
