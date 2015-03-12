class EventsController < ApplicationController
	before_action :set_event, :only => [:show, :edit, :update, :destroy]
	def index
		@events = Event.page(params[:page]).per(5)

begin	respond_to do |format|
			format.html
			#format.xml {render :xml => @events.to_xml}
			#format.json {render :json => @events.to_json}
			#format.atom { @feed_title = "My event list"}
	end
end
	end

	def new
		@event = Event.new
		Rails.logger.debug("event: #{@event.inspect}")
	end

	def create
		@event = Event.new(event_params)
		if @event.save
			redirect_to events_url
		else
			render :action => :new
		end
		flash[:notice] = "event was successfully created"
	end
    
    def update
		#@event = Event.find(params[:id])
		if @event.update(event_params)
			redirect_to event_url(@event)
		else
			render :action => :edit
		end
		flash[:notice] = "event was successfully updated"
	end
	
	def destroy
		#@event = Event.find(params[:id])
		@event.destroy
		flash[:notice] = "event was successfully destroy"

		redirect_to events_url
	end

	def show
		#@event = Event.find(params[:id])
		#@page_title = @event.name

		#respond_to do |format|
			#format.html { @page_title = @event.name }
			#format.xml
			#format.json {render :json => { id: @event.id, name: @event.name}. to_json}
		#end
	end

	def edit
		#@event = Event.find(params[:id])
	end



	private
	def set_event
		@event = Event.find(params[:id])
	end

	def event_params
		params.require(:event).permit(:name, :description, :category_id)
	end
end
