# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# coding: utf-8

%w{
  scenes_seed puzzles_seed
}.each do |part|
  require File.expand_path(File.dirname(__FILE__))+"/seeds/#{part}.rb"
end

story = Storyboard.create!(title: 'Alpha Board',
				   		   description: 'Initial board',
				   		   default: true)

#Scene.update_all(frame_id: story[:id])

1.upto(10) do |counter|
	frame = story.frames.create!(frame_order: counter)
	scene = Scene.find(counter)
	scene.frame_id = frame.frame_order
	scene.save!

	puzzle = Puzzle.find(counter)
	puzzle.frame_id = frame.frame_order
	puzzle.save!
end

# frame = story.frames.create!(frame_order: 1)

# scene = Scene.find(1)
# scene.frame_id = frame.frame_order
# scene.save!

# puzzle = Puzzle.find(1)
# puzzle.frame_id = frame.frame_order
# puzzle.save!