class HomeController < ApplicationController
  def index
  end

  def contacts
  end

  def exception_notifier
    # redirect_to unknown_path()
    3/0
  end
end
