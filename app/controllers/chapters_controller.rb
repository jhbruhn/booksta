class ChaptersController < ApplicationController
  before_filter :find_book
  before_filter :authenticate_user!, :except => [:index, :show]
  
  require 'whatlanguage'
  
  
  # GET /chapters/1
  # GET /chapters/1.json
  def show
    @chapter = Chapter.find(params[:id])
    @book = @chapter.book

    do_response @chapter
  end

  # GET /chapters/new
  # GET /chapters/new.json
  def new
    @chapter = @book.chapters.new

    do_response @chapter
  end

  # GET /chapters/1/edit
  def edit
    @chapter = Chapter.find(params[:id])
  end

  # POST /chapters
  # POST /chapters.json
  def create
    @chapter = @book.chapters.build(params[:chapter])
    
     respond_to do |format|
       if @book.user == current_user
          if @chapter.save
            format.html { redirect_to [@book, @chapter], :notice => 'Chapter was successfully added.' }
            format.json { render :json => [@book, @chapter], :status => :created, :location => [@book, @chapter] }
          else
            render_error_response("", "new", @chapter)
          end
       else
         render_error_response("U HAVE NO RIGHTS", "new", @chapter)
       end
     end
  end

  # PUT /chapters/1
  # PUT /chapters/1.json
  def update
    @chapter = Chapter.find(params[:id])

    respond_to do |format|
      if @book.user == current_user
        if @chapter.update_attributes(params[:chapter])
          format.html { redirect_to [@book, @chapter], :notice => 'Chapter was successfully edited.' }
          format.json { head :no_content }
        else
          format.html { render :action => "edit" }
          format.json { render :json => @chapter.errors, :status => :unprocessable_entity }
        end
      else
        format.html { render :action => "edit" , :alert => "U HAVE NO RIGHTS!" }
        format.json { render :json => @chapter, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /chapters/1
  # DELETE /chapters/1.json
  def destroy
    @chapter = Chapter.find(params[:id])
    if @chapter.book.user == current_user
      @chapter.destroy
    end
    
    respond_to do |format|
      format.html { redirect_to @book }
      format.json { head :no_content }
    end
  end
  
  private
    def find_book
      @book = Book.find(params[:book_id].to_i)
    end

end
