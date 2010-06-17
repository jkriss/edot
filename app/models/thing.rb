class Thing < ActiveRecord::Base
  
  belongs_to :subcategory, :foreign_key => 'thing_cat_id'
  belongs_to :user
  
  has_many :comments, :class_name => 'ThingComment', :dependent => :destroy
  
  validates_presence_of :thing_cat_id, :message => "must be selected"
  
  after_save :update_category_leader
  
  def points
    subcategory.points
  end
  
  def safe_text
    text.blank? ? "a thing!" : text
  end
  
  def update_category_leader
    cat = self.subcategory.category
    user_score = cat.user_points(self.user)
    logger.warn "comparing #{user.login}'s new category score of #{user_score} to the top score of #{cat.top_user_score}"
    cat.set_high_score(user, user_score) if cat.top_user_score.blank? || user_score > cat.top_user_score
  end
  
end
