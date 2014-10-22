class Project < ActiveRecord::Base
  include Workflow

  workflow do
    state :active do
      #repeating myself for each one of these, need to dry up
      event :active_to_queued, transitions_to: :queued
      event :active_to_on_hold, transitions_to: :on_hold
      event :active_to_completed, transitions_to: :completed
    end

    state :queued do
      event :queued_to_active, transitions_to: :active
      event :queued_to_on_hold, transitions_to: :on_hold
      event :queued_to_completed, transitions_to: :completed
    end

    state :on_hold do
      event :on_hold_to_active, transitions_to: :active
      event :on_hold_to_queued, transitions_to: :queued
      event :on_hold_to_completed, transitions_to: :completed
    end

    state :completed do
      event :completed_to_active, transitions_to: :active
      event :completed_to_on_hold, transitions_to: :on_hold
      event :completed_to_queued, transitions_to: :queued
    end
  end

  #need method that anytime a project status is set to active this method fires
  def queued_to_active
    puts "Email the Lead Analyst that the client changed this project to active!"
  end

end
