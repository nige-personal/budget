class TransactionHeadersController < ApplicationController
  before_action :set_transaction_header, only: [:show, :edit, :update, :destroy]
  before_action :form_dropdown_values, only: %i(new create edit)

  # GET /transaction_headers
  # GET /transaction_headers.json
  def index
    @transaction_headers = TransactionHeader.all
  end

  # GET /transaction_headers/1
  # GET /transaction_headers/1.json
  def show
    set_transaction_items
  end

  # GET /transaction_headers/new
  def new
    @transaction_header = TransactionHeader.new
    @transaction_header.transaction_items.build
  end

  # GET /transaction_headers/1/edit
  def edit
  end

  # POST /transaction_headers
  # POST /transaction_headers.json
  def create
    @transaction_header = TransactionHeader.new(transaction_header_params)
    respond_to do |format|
      if @transaction_header.save
        format.html { redirect_to @transaction_header, notice: 'Transaction header was successfully created.' }
        format.json { render :show, status: :created, location: @transaction_header }
      else
        format.html { render :new }
        format.json { render json: @transaction_header.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transaction_headers/1
  # PATCH/PUT /transaction_headers/1.json
  def update
    respond_to do |format|
      if @transaction_header.update(transaction_header_params)
        format.html { redirect_to @transaction_header, notice: 'Transaction header was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction_header }
      else
        format.html { render :edit }
        format.json { render json: @transaction_header.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transaction_headers/1
  # DELETE /transaction_headers/1.json
  def destroy
    @transaction_header.destroy
    respond_to do |format|
      format.html { redirect_to transaction_headers_url, notice: 'Transaction header was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_transaction_items
    @transaction_items = TransactionItem.where(transaction_header_id: @transaction_header.id)
  end

  def form_dropdown_values
    @users = User.where(id: current_user.id)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_transaction_header
    @transaction_header = TransactionHeader.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def transaction_header_params
    params.require(:transaction_header).permit(:user_id, :transaction_date, :account_id, :supplier_id, :sign, :reconciled, :total, transaction_items_attributes: [:category_id, :amount, :description])
  end
end
