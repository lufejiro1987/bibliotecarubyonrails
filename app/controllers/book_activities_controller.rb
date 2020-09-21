class BookActivitiesController < ApplicationController
  before_action :set_book_activity, only: [:show, :edit, :update, :destroy]

  # GET /book_activities
  # GET /book_activities.json
  def index
    @book_activities = BookActivity.all
  end

  # GET /book_activities/1
  # GET /book_activities/1.json
  def show
  end

  # GET /book_activities/new
  def new
    @book_activity = BookActivity.new
    @books = Book.all
  end

  # GET /book_activities/1/edit
  def edit
    @books = Book.all
  end

  # POST /book_activities
  # POST /book_activities.json
  def create
    @book_activity = BookActivity.new(book_activity_params)

    respond_to do |format|
      if @book_activity.save
        @book = Book.find(book_activity_params[:book_id])
        @book.status = book_activity_params[:activity]
        @book.save
        format.html { redirect_to @book_activity, notice: 'Book activity was successfully created.' }
        format.json { render :show, status: :created, location: @book_activity }
      else
        format.html { render :new }
        format.json { render json: @book_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_activities/1
  # PATCH/PUT /book_activities/1.json
  def update
    respond_to do |format|
      if @book_activity.update(book_activity_params)
        @book = Book.find(book_activity_params[:book_id])
        @book.status = book_activity_params[:activity]
        @book.save
        format.html { redirect_to @book_activity, notice: 'Book activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @book_activity }
      else
        format.html { render :edit }
        format.json { render json: @book_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_activities/1
  # DELETE /book_activities/1.json
  def destroy
    @book_activity.destroy
    respond_to do |format|
      format.html { redirect_to book_activities_url, notice: 'Book activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_activity
      @book_activity = BookActivity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_activity_params
      params.require(:book_activity).permit(:book_id, :date, :activity)
    end
end
