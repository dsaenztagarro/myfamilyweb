require_relative 'accessors'

module SimpleCrud
  class BaseController < ::ApplicationController
    include Accessors
    before_filter :find_model, :only => [:show, :edit, :update, :destroy]
    respond_to :html, :json

    class << self
      attr_accessor :model_klass

      def crud_for(klass, opts = {})
        @model_klass = klass
      end
    end

    # GET /models
    # GET /models.json
    def index
      models! model_klass.all
      respond_with models
    end

    # GET /models/1
    # GET /models/1.json
    def show
      respond_with model
    end

    # GET /models/new
    # GET /models/new.json
    def new
      model! model_klass.new
      respond_with model
    end

    # GET /models/1/edit
    def edit
    end

    # POST /models
    # POST /models.json
    def create
      model! model_klass.new(model_params)

      respond_to do |wants|
        if model.save
          flash[:notice] = 'model_klass was successfully created.'
          wants.html { redirect_to(model) }
          wants.json  { render :json => model, :status => :created, :location => model }
        else
          wants.html { render :action => "new" }
          wants.json  { render :json => model.errors, :status => :unprocessable_entity }
        end
      end
    end

    # PUT /models/1
    # PUT /models/1.json
    def update
      respond_to do |wants|
        if model.update_attributes(params[:model])
          flash[:notice] = 'model_klass was successfully updated.'
          wants.html { redirect_to(model) }
          wants.json  { head :ok }
        else
          wants.html { render :action => "edit" }
          wants.json  { render :json => model.errors, :status => :unprocessable_entity }
        end
      end
    end

    # DELETE /models/1
    # DELETE /models/1.json
    def destroy
      model.destroy

      respond_to do |wants|
        wants.html { redirect_to(models_url) }
        wants.json  { head :ok }
      end
    end

    private

    def find_model
      model! model_klass.find(params[:id])
    end
  end
end
