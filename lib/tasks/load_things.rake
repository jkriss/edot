task :load_thing_cats => :environment do
  
  json = File.open("#{Rails.root}/db/data/thing_cats.json").read
  data = ActiveResource::Formats::JsonFormat.decode(json)
  # puts data.inspect
  
  data.each do |cat_data|
    puts cat_data.inspect
    # puts "looking up cat #{cat_data['id']}"
    cat = Category.find(:first, :conditions => { :id => cat_data['id']} )
    subs = cat_data.delete('subcategories')
    
    if cat
      cat_data.delete('id')
      cat.update_attributes!(cat_data)
      puts "updated #{cat.inspect}"
    else
      puts "creating with #{cat_data.inspect}"
      cat = Category.create!(cat_data)
      puts "created #{cat.inspect}"
    end
    
    next unless subs
    subs.each do |sub_data|
      sub = Subcategory.find(:first, :conditions => { :id => sub_data['id'] })
      if sub
        sub_data.delete('id')
        sub.update_attributes!(sub_data)
        puts "  update #{sub.inspect}"
      else
        sub = cat.subcategories.create!(sub_data)
        puts "  created #{sub.inspect}"
      end
    end
      
  end

  
end