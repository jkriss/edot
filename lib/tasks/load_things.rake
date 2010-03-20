task :load_thing_cats => :environment do
  
  json = File.open("#{Rails.root}/db/data/thing_cats.json").read
  data = ActiveResource::Formats::JsonFormat.decode(json)
  # puts data.inspect
  
  data.each do |cat_data|
    puts cat_data.inspect
    # puts "looking up cat #{cat_data['id']}"
    cat = Subcategory.find(:first, :conditions => { :id => cat_data['id']} )
    if cat
      cat_data.delete('id')
      cat.update_attributes!(cat_data)
      puts "updated #{cat.inspect}"
    else
      cat = Subcategory.create!(cat_data)
      puts "created #{cat.inspect}"
    end
  end

  
end