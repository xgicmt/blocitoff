namespace :todo do
  desc "Delete tasks after 7 days"
  task delete_items: :environment do
  	Task.where("created_at <= ?", Time.now - 7.days).destroy_all
  end

end
