class RecordsController < ApplicationController
  # GET /records/new
  def new
    @record = Record.new
  end

  # POST /records
  def create
    @record = Record.new(record_params)
    delta_r = 16 + ((Player.find(@record.loser_id).rate.to_i) - (Player.find(@record.winner_id).rate.to_i)) * 0.04
    if delta_r > 31 then
      delta_r = 31
    elsif delta_r < 1 then
      delta_r = 1 
    end
    Player.update(@record.loser_id, :rate => Player.find(@record.loser_id).rate.to_i - delta_r)
    Player.update(@record.winner_id, :rate => Player.find(@record.winner_id).rate.to_i + delta_r)
    @record.save
    render :action => "new"
  end

  def show
    render :text => "hello world!"  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_record
      @player = Player.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def record_params
      params.require(:record).permit(:name, :winner_id, :loser_id, :fight_date)
    end

end
