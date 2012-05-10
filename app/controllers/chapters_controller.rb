class ChaptersController < ApplicationController
  before_filter :find_book
  before_filter :authenticate_user!, :except => [:index, :show]
  
  # GET /chapters/1
  # GET /chapters/1.json
  def show
    @chapter = Chapter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @chapter }
    end
  end

  # GET /chapters/new
  # GET /chapters/new.json
  def new
    @chapter = @book.chapters.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @chapter }
    end
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
            format.html { redirect_to [@book, @chapter], :notice => 'Chapter was successfully created.' }
            format.json { render :json => [@book, @chapter], :status => :created, :location => [@book, @chapter] }
          else
            format.html { render :action => "new" }
            format.json { render :json => @chapter.errors, :status => :unprocessable_entity }
          end
       else
         format.html { render :action => "new" , :notice => "U HAVE NO RIGHTS!" }
         format.json { render :json => @book, :status => :unprocessable_entity }
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
          format.html { redirect_to [@book, @chapter], :notice => 'Chapter was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render :action => "edit" }
          format.json { render :json => @chapter.errors, :status => :unprocessable_entity }
        end
      else
        format.html { render :action => "edit" , :notice => "U HAVE NO RIGHTS!" }
        format.json { render :json => @chapter, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /chapters/1
  # DELETE /chapters/1.json
  def destroy
    @chapter = Chapter.find(params[:id])
    @chapter.destroy

    respond_to do |format|
       if @book.user == current_user
         format.html { redirect_to @book }
        format.json { head :no_content }
      end
    end
  end
  
  private
    def find_book
      @book = Book.find(params[:book_id])
    end
end
