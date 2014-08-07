class InvoiceRowsController < ApplicationController
  include Inliner

  before_action :set_invoice_row, only: [:show, :edit, :update, :destroy]

  inline_object :invoice_row, :invoice

  # GET /invoice_rows
  # GET /invoice_rows.json
  def index
    @invoice_rows = @invoice ? @invoice.invoice_rows : InvoiceRow.all
  end

  # GET /invoice_rows/1
  # GET /invoice_rows/1.json
  def show
  end

  # GET /invoice_rows/new
  def new
    @invoice_row = @invoice ? @invoice.invoice_rows.build : InvoiceRow.new
  end

  # GET /invoice_rows/1/edit
  def edit
  end

  # POST /invoice_rows
  # POST /invoice_rows.json
  def create
    @invoice_row = @invoice.invoice_rows.create(invoice_row_params)

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


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice_row
      @invoice_row = InvoiceRow.find(params[:id]) if params[:id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_row_params
      params.require(:invoice_row).permit(:invoice_id, :desc, :value)
    end
end
