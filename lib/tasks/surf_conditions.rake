namespace :surf_conditions do
  desc "TODO"
  task update_all: :environment do
    spots = SurfSpot.all
    puts "Enqueuing update of #{spots.size} spot surf conditions in db..."
    spots.each do |spot|
      UpdateConditionJob.perform_later(spot.id)
    end
  end
end
