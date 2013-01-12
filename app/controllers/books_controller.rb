class BooksController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show, :new]
  
  
  
  # GET /books
  # GET /books.json
  def index
    @books = Book.all
    do_response @books
    #
    #respond_to do |format|
     # format.html # index.html.erb
      #format.json { render :json => @books }
      #end
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = Book.find(params[:id])
    @chapters = @book.chapters
    wl = WhatLanguage.new(:all)
    @lang = ""
    @book.chapters.each do
      @lang = wl.language(@book.chapters[0].content).to_s.capitalize
    end

    do_response @book.to_json(:include => :chapters)
  end

  # GET /books/new
  # GET /books/new.json
  def new
    @book = Book.new

    do_response @book
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(params[:book])
    @book.user = current_user
    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, :notice => 'Book was successfully created.' }
        format.json { render :json => @book, :status => :created, :location => @book }
      else
        render_error_response("", "new", @book)
      end
    end
  end

  # PUT /books/1
  # PUT /books/1.json
  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.user == current_user
        if @book.update_attributes(params[:book])
          successful_update_response @book
        else
          failed_update_response @book
        end
      else
        no_right_response @chapter
      end
    end
  end
  
  def successful_update_response(model)
    format.html { redirect_to model, :notice => 'Book was successfully edited.' }
    format.json { head :no_content }
  end
  
  def failed_update_response(model)
    format.html { render :action => "edit" }
    format.json { render :json => model.errors, :status => :unprocessable_entity }
  end
  
  def no_right_update_response(model)
    format.html { render :action => "edit" , :alert => "U HAVE NO RIGHTS!" }
    format.json { render :json => model, :status => :unprocessable_entity }
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book = Book.find(params[:id])
    if @book.user == current_user
      @book.destroy
    end

    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :no_content }
    end
  end
end
