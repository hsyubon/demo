class EventAttendeesController < ApplicationController
	before_action :find_event

	def index
		@attendees = @event.attendees
	end

	def show
		@attendees = @event.attendees.find(params[:id])
	end

	def new
		@attendees = @event.attendees.build
	end

	def create
		@attendees = @event.attendees.build(attendee_params)
		if @attendees.save
			redirect_to event_attendees_url(@event)
		else
			render :action => :new
		end
	end

	def edit
		@attendees = @event.attendees.find(params[:id])
	end

	def update
		@attendees = @event.attendees.find(params[:id])

		if @attendees.update(attendee_params)
			redirect_to event_attendees_url(@event)
		else
			render :action => :edit
		end
	end

	def destroy
		@attendees = @event.attendees.find(params[:id])
		@attendees.destroy

		redirect_to event_attendees_url(@event)
	end

	protected

	def find_event
		@event =Event.find(params[:event_id])
	end

	def attendee_params
		params.require(:attendee).permit(:name)
	end
	
end
