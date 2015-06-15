class DecaController < ApplicationController
  def create
    DecaMailer.contact_email(contact_params).deliver_now
    redirect_to ENV['DECA_REDIRECT'] || root_path
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :phone, :msg)
  end
end
