class PagesController < ApplicationController
  def home
    @page_title = "Home"
    @posts = Blog.all
    @skills = Skill.all
  end

  def about
    @skills = Skill.all
  end

  def contact
  end
end
