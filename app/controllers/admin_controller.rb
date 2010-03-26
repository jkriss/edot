require 'spreadsheet'

class AdminController < ApplicationController
  
  before_filter :require_admin

  def index
  end

  def local(date)
    TZInfo::Timezone.get('America/Los_Angeles').utc_to_local(date)
  end

  def add_thing_sheet(book)
    sheet = book.create_worksheet
    sheet.name = "Things"
    @things = Thing.find(:all, :order => 'created_at desc')
    headerfmt = Spreadsheet::Format.new :weight => :bold
    sheet.row(0).default_format = headerfmt
    datefmt = Spreadsheet::Format.new :number_format => 'YYYY-MM-DD hh:mm:ss'
    sheet.row(0).replace ['Date/Time', 'User', 'Category', 'Subcategory', 
                          'Points', 'Thing']
    widthlist = [ 18, 15, 15, 25, 7, 60 ]
    widthlist.each_index do |i|
      sheet.column(i).width = widthlist[i]
    end

    sheet.column(0).default_format = datefmt
    i = 0
    @things.each do |t|
      i += 1
      sheet.row(i).replace [local(t.created_at), t.user.login, 
                            t.subcategory.category.name, 
                            t.subcategory.name,  t.subcategory.points, t.text]
    end
  end

  def add_user_sheet(book)
    sheet = book.create_worksheet
    sheet.name = "Users"
    @users = User.find(:all, :order => 'login')
    headerfmt = Spreadsheet::Format.new :weight => :bold
    sheet.row(0).default_format = headerfmt
    datefmt = Spreadsheet::Format.new :number_format => 'YYYY-MM-DD hh:mm:ss'
    sheet.row(0).replace ['ID', 'Login', 'Name', 'Email', 'Acct Created', 
                          'Points', 'Twitter ID #', 'Location', 'Time Zone', 
                          'Description', 'URL', 'Profile image'] 
    widthlist = [ 7, 15, 20, 20, 18, 7, 10, 20, 15, 60, 30, 30 ]
    widthlist.each_index do |i|
      sheet.column(i).width = widthlist[i]
    end

    sheet.column(4).default_format = datefmt
    i = 0
    @users.each do |u|
      i += 1
      sheet.row(i).replace [u.id, u.login, u.name, u.email, local(u.created_at),
                            u.cached_points, u.twitter_id, u.location, 
                            u.time_zone, u.description, u.url, 
                            u.profile_image_url]  
    end
  end

  # Builds an excel report.
  def report_xls
    reportfile = '/tmp/excel-file2.xls'
    book = Spreadsheet::Workbook.new

    add_thing_sheet(book)
    add_user_sheet(book)

    book.write reportfile

    report = File.open(reportfile).read
    File.delete(reportfile)
    send_data report, :filename => 'foo2.xls', :content_type => 'application/vnd.ms-excel'
  end

end
