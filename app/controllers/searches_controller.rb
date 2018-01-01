class SearchesController < ApplicationController 
  def show
    @q = Episode.ransack(params[:q])
    @episodes = @q.result(distinct: true)

    respond_to do |format| 
      format.html
      format.json {
        @episodes = @episodes.limit(5)
      }
    end
  end
end