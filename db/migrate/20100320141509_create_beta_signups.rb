class CreateBetaSignups < ActiveRecord::Migration
  def self.up
    create_table :beta_signups do |t|
      t.string :email_address

      t.timestamps
    end
  end

  def self.down
    drop_table :beta_signups
  end
end
