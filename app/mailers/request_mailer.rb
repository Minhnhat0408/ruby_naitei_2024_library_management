class RequestMailer < ApplicationMailer
  helper RequestsHelper
  def rejection_email
    @request = params[:request]
    mail(
      to: @request.user.account.email,
      subject: t("request_mailer.failure.subject")
    )
  end

  def request_approved
    @request = params[:request]
    mail(
      to: @request.user.account.email,
      subject: t("request_mailer.success.subject")
    )
  end
end
