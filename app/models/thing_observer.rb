class ThingObserver < ActiveRecord::Observer
  def after_create(thing)
    thing.user.save!
  end
end