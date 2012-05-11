require 'htmlentities'

class BookPdf < Prawn::Document
  include ActionView::Helpers::SanitizeHelper
  
  def initialize(book, view)
    super(:top_margin => 70)
    @book = book
    title_page
    chapters
    finish
  end
  
  def title_page
    move_down 150
    
    span(450, :position => :center) do
      text @book.title, :style => :bold, :size => 80
    end
    
    move_up 20
    
    span(440, :position => :center) do
      text @book.subtitle, :size => 50
    end
    
    move_down 200
    
    span(300, :position => :right) do
      text "by "+@book.user.username, :font => 'Courier', :size => 40
    end
  end
  
  def chapters
    coder = HTMLEntities.new
    @book.chapters.each do |chapter|
      start_new_page
      header(chapter.title)
      span(450, :position => :center) do
        text strip_tags coder.decode chapter.content
      end
    end
    
  end
  
  def finish
    number_pages "page <page> of <total>",{ :at => [bounds.right - 150, 0],
                  :width => 150,
                  :align => :right,
                  :start_count_at => 1 }
  end
  
  def header(str)
    text(str, :size => 25, :style => :bold)
    stroke_horizontal_rule
    move_down 30
  end
end