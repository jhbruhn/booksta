class PagesController < ApplicationController
  def home
    @newBooks = Book.order("created_at DESC").limit(3)
    @newUsers = User.order("created_at DESC").limit(3)
  end

  def wthit
  end

  def who
  end
end
