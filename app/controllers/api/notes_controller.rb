class Api::NotesController < ApplicationController
  def index
    diary_id = params[:diary_id]

    render json: Diary.find(diary_id).notes
  end

  def create
    diary_id = params[:diary_id]
    @diary = Diary.find(diary_id)
    @note = @diary.notes.new(notes_params)

    if @note.save
      render json: @note, status: :created
    else
      render json: @note.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    @note = Note.find(params[:id])

    if @note.update(notes_params)
      render json: @note, status: :created
    else
      render json: @note.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    id = params[:id]
    @note = Note.find(id)

    if @note.destroy
      render json: @note, status: :no_content
    else
      render json: @note.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def notes_params
    params.require(:note).permit(:text)
  end
end
