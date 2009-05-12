class ReseauxController < ApplicationController
  def index
    @associations = Association.find_the_crajep_ones
  end

  def show
  end

  def nex
  end

  def edit
  end

end
