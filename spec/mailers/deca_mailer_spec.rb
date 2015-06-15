require 'rails_helper'

RSpec.describe DecaMailer, type: :mailer do
  describe '.contact_email' do
    before do
      @mail = DecaMailer.contact_email(
        name: 'Some Name',
        email: 'some@email.com',
        phone: '1-800-123-4567',
        msg: 'Hi there! This is a contact message.'
      )
    end

    it 'uses the correct email subject' do
      expect(@mail).to have_subject(ENV['DECA_EMAIL_SUBJECT'])
    end

    it 'uses default sender address' do
      expect(@mail).to be_delivered_from(ENV['DEFAULT_EMAIL_FROM'])
    end

    it 'sends to correct recipient' do
      expect(@mail).to be_delivered_to(ENV['DECA_EMAIL_RECIPIENT'])
    end

    it 'has the correct email body' do
      html = '<h1>New contact received</h1><p><b>Name:<b> Some Name</p><p><b>Email:<b> some@email.com</p><p><b>Phone:<b> 1-800-123-4567</p><p><b>Msg:<b> Hi there! This is a contact message.</p><p><b>THIS IS AN AUTO-GENERATED EMAIL. DO NOT REPLY TO THIS EMAIL.</b><p>'
      expect(@mail).to have_body_text(html)
    end
  end
end
