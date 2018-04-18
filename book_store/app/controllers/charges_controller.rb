class ChargesController < ApplicationController

  def create

    @book = Book.find(params[:id])

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: (@book.price * 100),
      description: 'Rails Stripe Customer',
      currency: 'aud'
    )

    # @books = Book.all
    # render('pages/books')

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to(new_charge_path)


  end

end
