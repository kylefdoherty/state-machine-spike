class Project < ActiveRecord::Base
  include Workflow

  workflow do
    [:active, :queued, :on_hold, :completed].each do |state_name|
      state state_name do
        event :to_queued, transitions_to: :queued
        event :to_on_hold, transitions_to: :on_hold
        event :to_completed, transitions_to: :completed
        event :to_active, transitions_to: :active
      end
    end
  end

  def to_active
    puts "Email the Lead Analyst that the client changed this project to active!"
  end

  def to_completed
    puts "Email the Lead Analyst that the client changed this project to completed!"
  end

  def to_on_hold
    puts "lol"
  end

end
