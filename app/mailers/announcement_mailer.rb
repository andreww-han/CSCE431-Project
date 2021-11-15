class AnnouncementMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.announcement_mailer.announcement_created.subject
  #
  def announcement_created
    @member = params[:member]
    @announcement = params[:announcement]
    @greeting = "Hi"

    mail(
      bcc: Member.all.pluck(:email),
      subject: Announcement.last.title
    )
  end
end
