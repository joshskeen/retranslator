class TranslationsController < ApplicationController

  respond_to :json, :html

  def index
    @translation = Translation.new
    @translations = Translation.all
  end

  def create
    @translation = Translation.new(params[:translation])
    @translation.save
    @translation.perform
    respond_with(@translation)
  end

  def show
    @translation = Translation.find(params[:id])
    @translation_steps = @translation.translation_steps.reverse
  end
end
