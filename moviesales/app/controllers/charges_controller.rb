class ChargesController < ApplicationController


  # def new
  #   @movie = Movie.find(params[:nope])
  #   @amount = @movie.price * 100
  # end

  def create

    @movie = Movie.find(params[:id])

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: (@movie.price * 100).to_i,
      description: 'Rails Stripe Customer',
      currency: 'aud'
    )

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path

  end

end
