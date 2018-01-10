class SearchesController < ApplicationController 
  def show
    @q = Episode.ransack(name_cont: params[:id])
    @episodes = @q.result(distinct: true)

    respond_to do |format| 
      format.html
      format.json {
        @episodes = @episodes.limit(5)
      }
    end
  end
end