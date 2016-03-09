class RecipientNotifier < ApplicationMailer
  default from: 'test@example.com'

  def send_email(recipient, url)
    @recipient = recipient
    @url = url
    mail( to: @recipient.email, subject: 'Checkout this link!' )
  end
end
