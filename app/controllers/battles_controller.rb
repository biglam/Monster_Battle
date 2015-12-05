class BattlesController < ApplicationController

  def index
    @battles = Battle.all
  end

  def new
    @battle = Battle.new
  end
  
end
