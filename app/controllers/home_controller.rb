class HomeController < ApplicationController
  def welcome; end

  def contact
    @org = Organization.last
  end
end
