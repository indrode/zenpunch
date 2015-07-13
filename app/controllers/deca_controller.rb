class DecaController < ApplicationController
  def create
    # TODO: refactor
    if contact_params[:alternative].nil? && contact_params[:phone].strip != '123456'
      DecaMailer.contact_email(contact_params).deliver_now
    end
    redirect_to ENV['DECA_REDIRECT'] || root_path
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :phone, :msg, :alternative)
  end
end
