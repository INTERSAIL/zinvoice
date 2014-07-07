class InvoiceRowsController < ApplicationController
  before_action :set_invoice_row, only: [:show, :edit, :update, :destroy]
  before_action :set_invoice, only: [:index, :new, :create, :form_for_update]
  before_action :set_invoice_row_from_params, only: [:form_for, :form_for_update]

  # GET /invoice_rows
  # GET /invoice_rows.json
  def index
    @invoice_rows = @invoice.invoice_rows
  end

  # GET /invoice_rows/1
  # GET /invoice_rows/1.json
  def show
  end

  # GET /invoice_rows/new
  def new
    @invoice_row = @invoice.invoice_rows.new
  end

  # GET /invoice_rows/1/edit
  def edit
  end

  # POST /invoice_rows
  # POST /invoice_rows.json
  def create
    @invoice_row = @invoice.invoice_rows.create(invoice_row_params)#InvoiceRow.new(invoice_row_params)

    respond_to do |format|
      if @invoice_row.save
        format.html { redirect_to edit_invoice_path(@invoice), notice: 'Invoice row was successfully created.' }
        format.json { render action: 'show', status: :created, location: @invoice_row }
      else
        format.html { render action: 'new' }
        format.json { render json: @invoice_row.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoice_rows/1
  # PATCH/PUT /invoice_rows/1.json
  def update
    respond_to do |format|
      if @invoice_row.update(invoice_row_params)
        format.html { redirect_to @invoice_row, notice: 'Invoice row was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @invoice_row.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoice_rows/1
  # DELETE /invoice_rows/1.json
  def destroy
    @invoice_row.destroy
    respond_to do |format|
      format.html { redirect_to invoice_rows_url }
      format.json { head :no_content }
    end
  end

  def form_for
    respond_to do |format|
      format.html { render layout: false }
      format.json { render json: @invoice_row, status: 200 }
    end
  end

  def form_for_update
    respond_to do |format|
      format.html { render layout: false }
      format.json { render json: @invoice_row, status: 200 }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice_row
      @invoice_row = InvoiceRow.find(params[:id]) if params[:id]
    end

    def set_invoice
      @invoice = Invoice.find(params[:invoice_id]) if params[:invoice_id]
    end

    def set_invoice_row_from_params
      set_invoice_row
      @invoice_row ||= InvoiceRow.new
      @invoice_row.assign_attributes invoice_row_params
      #set_invoice if @invoice_row.new_record?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_row_params
      params.require(:invoice_row).permit(:invoice_id, :desc, :value)
    end
end
