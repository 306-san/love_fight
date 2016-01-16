class RecordsController < ApplicationController
  # GET /records/new
  def new
    @record = Record.new
  end

  # POST /records
  def create
    @record = Record.new(record_params)
    respond_to do |format|
      if @record.save
        format.html { redirect_to @record, notice: 'record was successfully created.' }
        format.json { render :show, status: :created, location: @record }
      else
        format.html { render :new }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

end
