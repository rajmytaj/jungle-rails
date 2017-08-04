class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'
 
  def receipt_email(user,order)
    @user = user
    @order = order.stripe_order
    mail(to: @user.email, subject: "Here's your Jungle order! #{@order}")
  end
end
