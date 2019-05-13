class PickPack < ApplicationRecord
	def pick_pack(picker,package,items)
		picker = picker
		package = package
		items = items
		data = [{
					"name": "Item 1",
					"pickup_time": 10,
					"packaging_time": 20
				},{
					"name": "Item 2",
					"pickup_time": 5,
					"packaging_time": 12
				},{
					"name": "Item 3",
					"pickup_time": 5,
					"packaging_time": 10
				}]

		if items.present?
			sorted_list = items.map { |e| e if e < 4  }.compact.sort
			if sorted_list.count > 3
				puts "we have trimed the list only 3 items can be selected at a time."
				new_list = sorted_list[0,3]
			else
				new_list = sorted_list
			end
			@pickup_time = []
			@packaging_time = []
			new_list.each do |item|
				@pickup_time << data[item - 1][:pickup_time]
				@packaging_time << data[item - 1][:packaging_time]
			end

			if picker.to_i == 1
				pickup_time = @pickup_time.sum
			elsif picker.to_i == 2
				if @pickup_time.count == 1 || @pickup_time.count == 2
					pickup_time = @pickup_time.max
				elsif @pickup_time.count == 3
					max_pickup_time = @pickup_time.max
					sorted_pickup_time = @pickup_time.sort
					pick_first_two_items = sorted_pickup_time[0,2]
					if max_pickup_time >= pick_first_two_items.sum
						pickup_time = @pickup_time.max
					else
						pickup_time = pick_first_two_items.sum
					end
				else
					pickup_time = "unable to calculate pickup time for zero items"
				end
			elsif picker.to_i >= 3
				pickup_time = @pickup_time.max
			else
				pickup_time = "unable to calculate pickup time as no bots are assign"				
			end

			if package.to_i == 1
				packaging_time = @packaging_time.sum
			elsif package.to_i == 2
				if @packaging_time.count == 1 || @packaging_time.count == 2
					packaging_time = @packaging_time.max
				elsif @packaging_time.count == 3
					max_packaging_time = @packaging_time.max
					sorted_packaging_time = @packaging_time.sort
					pick_first_two_items = sorted_packaging_time[0,2]
					if max_packaging_time >= pick_first_two_items.sum
						packaging_time = @packaging_time.max
					else
						packaging_time = pick_first_two_items.sum
					end
				else
					packaging_time = "unable to calculate package time for zero items"
				end
			elsif package.to_i >= 3
				packaging_time = @packaging_time.max
			else
				packaging_time = "unable to calculate package time as no bots are assign"				
			end

			return "Total pickup time taken by #{picker} bots are #{pickup_time} seconds and packaging time taken by #{package} bots are #{packaging_time} seconds"
		else
			return "No item is present."
		end
	end
end
