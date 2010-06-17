require 'digest/sha1'

class User < TwitterAuth::GenericUser
  
  has_many :things, :order => 'created_at desc'
  
  has_many :recent_subcategories, :class_name => 'Subcategory', :through => :things, :source => :subcategory, :order => 'things.created_at desc', :limit => 5
  
  has_many :replies, :class_name => 'ThingComment', :through => :things, :source => :comments, :order => 'created_at desc'
  
  include Authentication
  include Authentication::ByPassword
  include Authentication::ByCookieToken
  
  validates_presence_of     :login
  validates_length_of       :login,    :within => 3..40
  validates_uniqueness_of   :login,    :case_sensitive => false
  validates_format_of       :login,    :with => Authentication.login_regex, :message => Authentication.bad_login_message

  validates_format_of       :name,     :with => Authentication.name_regex,  :message => Authentication.bad_name_message, :allow_nil => true
  validates_length_of       :name,     :maximum => 100

  # validates_presence_of     :email
  # validates_length_of       :email,    :within => 6..100 #r@a.wk
  validates_uniqueness_of   :email, :allow_nil => true
  # validates_format_of       :email,    :with => Authentication.email_regex, :message => Authentication.bad_email_message

  before_save :update_cached_points

  # HACK HACK HACK -- how to do attr_accessible from here?
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :login, :email, :name, :password, :password_confirmation, :is

  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  #
  # uff.  this is really an authorization, not authentication routine.  
  # We really need a Dispatch Chain here or something.
  # This will also let us return a human error message.
  
  def new_replies
    last_comment_view.nil? ? replies : replies.find(:all, :conditions => ["thing_comments.created_at > ?", last_comment_view])
  end
  
  def self.authenticate(login, password)
    return nil if login.blank? || password.blank?
    u = find_by_login(login.downcase) || find_by_email(login.downcase) # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  def login=(value)
    write_attribute :login, (value ? value.downcase : nil)
  end

  def email=(value)
    write_attribute :email, (value ? value.downcase : nil)
  end
  
  def points
    cached_points
  end
  
  def update_cached_points
    total = 0
    things.each do |t|
      total += t.points
    end
    self.cached_points = total
  end

  protected
    


end
