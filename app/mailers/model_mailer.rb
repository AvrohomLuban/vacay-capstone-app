class ModelMailer < ApplicationMailer
  default from: "itstimetovacay@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.model_mailer.contact_us.subject
  #
  # def contact_us
  #   @greeting = "Hi"
  #   mail to: "to@example.org"
  # end

  def contact_us(record)
    @record = record
    mail(to: "itstimetovacay@gmail.com", subject: "Contact Us.")
  end

end
