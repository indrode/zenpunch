class DecaController < ApplicationController
  before_action :validate_params!, only: [:create]

  def create
    DecaMailer.contact_email(contact_params).deliver_now
    redirect_to ENV['DECA_REDIRECT'] || root_path
  end

  private

  def validate_params!
    render plain: 'Invalid data!' unless (contact_params[:alternative].nil? && contact_params[:phone].strip != '123456')
  end

  def contact_params
    params.require(:contact).permit(:name, :email, :phone, :msg, :alternative)
  end
end
