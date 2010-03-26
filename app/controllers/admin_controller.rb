require 'spreadsheet'

class AdminController < ApplicationController
  
  before_filter :require_admin

  def index
  end
  
  # Builds an excel report.
  def report_xls

    #FileUtils.copy('/tmp/excel-file.xls', '/tmp/excel-file2.xls')    
    reportfile = '/tmp/excel-file2.xls'
    book = Spreadsheet::Workbook.new
    sheet1 = book.create_worksheet
    @things = Thing.find(:all, :order => 'created_at desc')
    i = 0
    @things.each do |t|
      i += 1
      sheet1.row(i).replace [t.text]
    end
    book.write reportfile

    report = File.open(reportfile).read
    File.delete(reportfile)
    #debug = "<pre>"
    #@things.each do |t|
    #  debug << t.text
    #  debug << " -- "
    #  debug << t.created_at.strftime("%B %d, %I:%M %p")
    #  debug << "\n"
    #end
    #debug << "</pre>"
    #render :text => debug
    #render :file => reportfile, :content_type => 'application/vnd.ms-excel'
    send_data report, :filename => 'foo2.xls', :content_type => 'application/vnd.ms-excel'
    #report
  end

end
