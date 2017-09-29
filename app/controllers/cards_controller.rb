class CardsController < ApplicationController
  def create
    Card.new(card_params).save!
    redirect_to thankyou_checkouts_path
  end

  private

  def card_params
    params.require(:card).permit(:card_number, :user_id, checkouts_attributes: [:email, :address, :order_id])
  end
end