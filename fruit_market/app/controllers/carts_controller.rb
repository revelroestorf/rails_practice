class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  # before_action :user_setup, only: [:index]

  # GET /carts
  # GET /carts.json
  def index
    @carts = current_user.carts.all
    @total = 0
    @carts.each do |cart|
      @total += cart.product.price * cart.qty
    end
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    @product = Product.find(params[:id])
    @cart = Cart.new
    @cart.product_id = @product.id
    @cart.user_id = current_user.id
    @cart.qty = 1

    if current_user.carts.find_by(product_id: @cart.product_id) == nil

      respond_to do |format|
        if @cart.save
          @product.stock -= @cart.qty
          @product.save
          format.html { redirect_to products_path, notice: 'Item added to cart.' }
          format.json { render :show, status: :created, location: @cart }
        else
          format.html { render :new }
          format.json { render json: @cart.errors, status: :unprocessable_entity }
        end
      end

    else
      updated_cart = current_user.carts.find_by(product_id: @cart.product_id)
      updated_cart.qty += @cart.qty
      respond_to do |format|
        if updated_cart.save
          @product.stock -= @cart.qty
          @product.save
          format.html { redirect_to products_path, notice: 'Item quantity updated in cart.' }
          format.json { render :show, status: :created, location: updated_cart }
        else
          format.html { render :new }
          format.json { render json: updated_cart.errors, status: :unprocessable_entity }
        end
      end

    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to carts_path, notice: 'Quantity updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Item removed.' }
      format.json { head :no_content }
    end
  end

  private

    # def user_setup
    #   if current_user is admin
    # end
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit(:user_id, :product_id, :qty)
    end
end
