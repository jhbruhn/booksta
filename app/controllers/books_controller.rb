class BooksController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  
  
  
  # GET /books
  # GET /books.json
  def index
    @books = Book.all
   
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @books }
    end
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
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @book.to_json(:include => :chapters) }
    end
  end

  # GET /books/new
  # GET /books/new.json
  def new
    @book = Book.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @book }
    end
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
        format.html { render :action => "new" }
        format.json { render :json => @book.errors, :status => :unprocessable_entity }
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
          format.html { redirect_to @book, :notice => 'Book was successfully edited.' }
          format.json { head :no_content }
        else
          format.html { render :action => "edit" }
          format.json { render :json => @book.errors, :status => :unprocessable_entity }
        end
      else
        format.html { render :action => "edit" , :alert => "U HAVE NO RIGHTS!" }
        format.json { render :json => @chapter, :status => :unprocessable_entity }
      end
    end
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
