class Category < ActiveRecord::Base
  
  default_scope :order => 'name asc'
  has_many :category_subcategories
  has_many :subcategories, :through => :category_subcategories
  belongs_to :top_user, :class_name => 'User'
  
  
  def total_points(conditions={})
    total = 0
    subcategories.each do |s|
      s.things.find(:all, :conditions => conditions).each do |t|
        total += t.points
      end
    end
    total
  end
  
  def user_points(user, start_date=Time.now.beginning_of_month)
    total_points(['user_id = ? and created_at > ?', user.id, start_date] )
  end
  
  def top_user_with_check
    find_top_user if top_user_updated_at < Time.now.beginning_of_month
    top_user_without_check
  end
  alias_method_chain :top_user, :check
  
  def find_top_user
    logger.warn "calculating top user for #{self.name}"
    self.top_user_score = 0
    self.top_user = nil
    User.all.each do |u|
      score = user_points(u)
      if top_user_score.blank? || score > top_user_score
        set_high_score(u, score)
      end
    end
    if self.top_user.nil?
      self.top_user_updated_at = Time.now
      self.save
    end
  end
  
  def set_high_score(user, score)
    self.top_user = user
    self.top_user_score = score
    self.top_user_updated_at = Time.now
    self.save
  end
  
end
