class TranslationsController < ApplicationController

  respond_to :json, :html

  def index
    @translation = Translation.new
    @translations = Translation.scoped.page params[:page]
  end

  def create
    @translation = Translation.new(params[:translation])
    if @translation.save
      @translation.perform
      if params.has_key?(:api)
        render text: @translation.ending_phrase
      else
        respond_with(@translation)
      end
    else
      @translations = Translation.scoped.page params[:page]
      render :index
    end
  end

  def show
    @translation = Translation.find(params[:id])
    @translation_steps = @translation.translation_steps.reverse
  end
end
