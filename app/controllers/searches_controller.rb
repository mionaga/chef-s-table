class SearchesController < ApplicationController
  
  def search
    @model = params[:model]
    @word = params[:word]
    @search = params[:search]
    
    if @model == "end_user"
      @records = EndUser.looks(@search, @word)
    else
      @records = Recipe.looks(@search, @word)
    end
  end  
  
end
