class ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.json
  before_filter :authenticate_user!, except: [:index, :show]
  def index
    @articles = Article.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    @article = Article.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create
    params[:article][:content] = tag_content(params[:article][:content], false)
    @article = current_user.articles.build(params[:article])

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render json: @article, status: :created, location: @article }
      else
        format.html { render action: "new" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    @article = Article.find(params[:id])
    params[:article][:content] = tag_content(params[:article][:content], false)
    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end

  #GET /articles/import
  #POST /articles/import
  def import
    if request.post?
      source = Pismo::Document.new(params[:url], reader: :cluster)
      content = tag_content(source.html_body, true)
      @article = current_user.articles.build(title: source.title, content: content)
      if @article.save
        redirect_to @article, notice: 'Article was successfully created.'
      else
        render "import"
      end
    else
      render "import"
    end
  end

  def tag_content(content,import)
    tagged_content = Nokogiri::HTML::DocumentFragment.parse(content)
    tagged_content.css('p, blockquote, ul, ol').each do |block|
      if block['id'].nil? || import
        block['id'] = Zlib.crc32 block.content
      end
    end
    return tagged_content.to_s
  end
end
