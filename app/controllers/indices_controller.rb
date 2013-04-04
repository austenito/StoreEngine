class IndicesController < ApplicationController
  # GET /indices
  # GET /indices.json
  def index
    @indices = Index.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @indices }
    end
  end
end
