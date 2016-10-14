class AlgorithmController < ApplicationController
  def index
    @algorithm = Algorithm.order(:name)
  end
end
