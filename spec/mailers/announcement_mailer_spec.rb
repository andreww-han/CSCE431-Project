require 'rails_helper'

RSpec.describe AnnouncementMailer, type: :mailer do
  describe 'announcement_created' do
    let(:mail) { AnnouncementMailer.announcement_created }
    let(:member) { mock_model Member, name: Nate, email: 'from@example.com' }

    it 'renders the headers' do
      expect(mail.subject).to eq('Announcement created')
      expect(mail.to).to eq(['to@example.org'])
      expect(mail.from).to eq(['from@example.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('Hi')
    end
  end
end
