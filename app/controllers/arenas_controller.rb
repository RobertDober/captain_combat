class ArenasController < ApplicationController
  # Useful in the BO
  # before_action :set_arena, only: [:show, :edit, :update, :destroy]
  before_action :set_arena, only: :show

  # Useful in the BO
  # def index
  #   @arenas = Arena.all
  # end

  # Useful in the BO
  def show
  end

  # Useful in the BO
  # def new
  #   @arena = Arena.new
  # end

  # Useful in the BO
  # def edit
  # end

  # Useful in the BO
  # def create
  #   @arena = Arena.new(arena_params)

  #   respond_to do |format|
  #     if @arena.save
  #       format.html { redirect_to @arena, notice: 'Arena was successfully created.' }
  #       format.json { render :show, status: :created, location: @arena }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @arena.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # Useful in the BO
  # def update
  #   respond_to do |format|
  #     if @arena.update(arena_params)
  #       format.html { redirect_to @arena, notice: 'Arena was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @arena }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @arena.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # Useful in the BO
  # def destroy
  #   @arena.destroy
  #   respond_to do |format|
  #     format.html { redirect_to arenas_url, notice: 'Arena was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_arena
      @arena = Arena.find(params[:id])
    end

    # # Never trust parameters from the scary internet, only allow the white list through.
    def arena_params
      params.require(:arena).permit(:arena_name, :arena_description)
    end
end
