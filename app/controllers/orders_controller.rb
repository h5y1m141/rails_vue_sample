class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :set_products, only: [:new]

  def index
    @orders = Order.all
  end

  def show
  end

  def new
    @order = Order.new
    @order_detail = OrderDetail.new
  end

  def edit
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      flash[:notice] = '注文を受け付けました'
      redirect_to orders_path
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order)
      .permit(:user_id, order_details_attributes: [:product_id, :quantity])
  end

  def set_products
    @products = Product.pluck(:title, :id)
  end
end
