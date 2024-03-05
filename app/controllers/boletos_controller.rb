class BoletosController < ApplicationController
  before_action :set_boleto, only: %i[ show edit update destroy ]

  # GET /boletos or /boletos.json
  def index
    @clientes = Cliente.all
    @clientes_options = @clientes.map { |c| [c.person_name, c.id] }

    if params[:cliente_id].present?
      @boletos = Boleto.where(cliente_id: params[:cliente_id])
    else
      @boletos = Boleto.all
    end

    @total_boletos = @boletos.count
  end

  # GET /boletos/1 or /boletos/1.json
  def show
  end

  # GET /boletos/new
  def new
    @boleto = Boleto.new
  end

  # GET /boletos/1/edit
  def edit
  end

  # POST /boletos or /boletos.json
  def create
    @boleto = Boleto.new(boleto_params)

    respond_to do |format|
      if @boleto.save
        format.html { redirect_to boleto_url(@boleto), notice: "Boleto was successfully created." }
        format.json { render :show, status: :created, location: @boleto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @boleto.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /boletos/1 or /boletos/1.json
  def update
    respond_to do |format|
      if @boleto.update(boleto_params)
        format.html { redirect_to boleto_url(@boleto), notice: "Boleto was successfully updated." }
        format.json { render :show, status: :ok, location: @boleto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @boleto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boletos/1 or /boletos/1.json
  def destroy
    @boleto.destroy!

    respond_to do |format|
      format.html { redirect_to boletos_url, notice: "Boleto was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_boleto
    @boleto = Boleto.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def boleto_params
    params.require(:boleto).permit(:amount, :expire_at, :bank_billet_account_id, :bank_billet_layout_id, :description,
     :cliente_id)
  end
end
