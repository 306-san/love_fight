class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]
  # GET /players
  # GET /players.json
  def index
    players = Player.all
    @rate_num = 0
    @players_sort = players.order("rate DESC")
    @player_box = @players_sort.where("type_id = '1'")
    @player_kick = @players_sort.where("type_id = '2'")
    @player_cap = @players_sort.where("type_id = '3'")
    @player_mue = @players_sort.where("type_id = 4")

  end
  # GET /players/1
  # GET /players/1.json
  def show

  end

  # GET /
  def hope

    p1_id = params[:id]["id"][0]
    p2_id = params[:id]["id"][1]

    p1_que = Player.find(p1_id)
    @p1_name = p1_que.name
    @p1_img = p1_que.prof_pic
    p2_que = Player.find( p2_id )
    @p2_name = p2_que.name
    @p2_img = p2_que.prof_pic

  end

  # GET /players/new
  def new
    @player = Player.new
  end
  # GET /players/1/edit
  def edit
  end

  # POST /players
  def create
    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        format.html { redirect_to @player, notice: 'Player was successfully created.' }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player.destroy
    respond_to do |format|
      format.html { redirect_to players_url, notice: 'Player was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      params.require(:player).permit(:name, :prof_pic, :login_id, :login_pass, :description, :type_id)
    end
end
