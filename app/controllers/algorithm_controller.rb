class AlgorithmController < ApplicationController
  def index
    if params[:search]
      empty_search = false
#params[:search].keep_if {|k, val| !val.blank?}.empty?
    else
      empty_search = true
    end

    if empty_search
     @algorithms=Algorithm.all

    else
     # a search was submitted
     @searchval = Algorithm.searchbar(params[:search])
     @algorithms = @searchval.all
    end
	end
end
