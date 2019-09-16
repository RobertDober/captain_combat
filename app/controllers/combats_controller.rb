class CombatsController < ApplicationController
  before_action :set_combat, only: [:show, :edit, :update, :destroy]

  # GET /combats/1
  # GET /combats/1.json
  def show
  end

  # GET /combats/new
  def new
    @combat = Combat.new
  end

  # POST /combats
  # POST /combats.json
  def create
    @combat = Combat.new()
      require 'pry'; binding.pry
    
    BattleService.validate(@combat, combat_params)

    respond_to do |format|
      if @combat.valid?
        format.html { redirect_to @combat.run(combat_params), notice: 'Battle finished.' }
      else
        format.html { render :new }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_combat
      @combat = Combat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def combat_params
      params.require(:combat).permit(:player1_id, :player2_id)
    end
end
