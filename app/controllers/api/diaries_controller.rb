class Api::DiariesController < ApplicationController
  def index
    render json: Diary.all
  end

  def show
    id = params[:id]

    render json: Diary.find(id)
  end

  def create
    @diary = Diary.new(diary_params)

    if @diary.save
      render json: @diary, status: :created
    else
      render json: @diary.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    id = params[:id]
    @diary = Diary.find(id)

    if @diary.update(diary_params)
      render json: @diary, status: :created
    else
      render json: @diary.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    id = params[:id]
    @diary = Diary.find(id)

    if @diary.destroy
      render json: @diary, status: :no_content
    else
      render json: @diary.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def diary_params
    params.require(:diary).permit(:title, :expiration, :kind)
  end
end
