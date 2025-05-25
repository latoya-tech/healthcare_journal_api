# app/controllers/api/v1/journal_entries_controller.rb
class Api::V1::JournalEntriesController < ApplicationController
  before_action :set_journal_entry, only: [:show, :update, :destroy]

  # GET /api/v1/journal_entries
  def index
    @journal_entries = JournalEntry.all
    render json: @journal_entries
  end

  # GET /api/v1/journal_entries/1
  def show
    render json: @journal_entry
  end

  # POST /api/v1/journal_entries
  def create
    @journal_entry = JournalEntry.new(journal_entry_params)

    if @journal_entry.save
      render json: @journal_entry, status: :created
    else
      render json: @journal_entry.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/journal_entries/1
  def update
    if @journal_entry.update(journal_entry_params)
      render json: @journal_entry
    else
      render json: @journal_entry.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/journal_entries/1
  def destroy
    @journal_entry.destroy
    head :no_content
  end

  private
    def set_journal_entry
      @journal_entry = JournalEntry.find(params[:id])
    end

    def journal_entry_params
      params.require(:journal_entry).permit(:recorded_at, :cpg, :symptoms, :activities)
    end
end
