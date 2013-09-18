class NotesController < ApplicationController
  # GET /notes
  # GET /notes.json
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :get_article
  def get_article
    @article= Article.find(params[:article_id])
  end

  def index
    @notes = @article.notes

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @notes }
    end
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
    @note = @article.notes.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @note }
    end
  end

  # GET /notes/new
  # GET /notes/new.json
  def new
    @note = @article.notes.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @note }
    end
  end

  # GET /notes/1/edit
  def edit
    @note = @article.notes.find(params[:id])
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = @article.notes.new(params[:note])
    @note.user = current_user

    respond_to do |format|
      if @note.save
        format.html { redirect_to([@note.article, @note], notice: 'Note was successfully created.') }
        format.json { render json: @note, status: :created, location: @note }
      else
        format.html { render action: "new" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /notes/1
  # PUT /notes/1.json
  def update
    @note = @article.notes.find(params[:id])

    respond_to do |format|
      if @note.update_attributes(params[:note])
        format.html { redirect_to([@note.article, @note], notice: 'Note was successfully updated.') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note = @article.notes.find(params[:id])
    @note.destroy

    respond_to do |format|
      format.html { redirect_to article_notes_url }
      format.json { head :no_content }
    end
  end
end
