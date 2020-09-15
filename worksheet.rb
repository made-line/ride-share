########################################################
# Step 1: Establish the layers

# In this section of the file, as a series of comments,
# create a list of the layers you identify.
# Create a list of the layers you identify:
# Driver ID, date, cost, rider rating

# Which layers are nested in each other?
# Date, cost, rider ID, rating are nested in driver ID. All driver IDs are grouped together.

# Which layers of data "have" within it a different layer?
# Driver ID and all driver IDs

# Which layers are "next" to each other?
# date, cost, rider ID, rating

########################################################

# Step 2: Assign a data structure to each layer

# Copy your list from above, and in this section
# determine what data structure each layer should have
# All drivers - hash
# Driver ID - hash
# Everything else - hash in array


########################################################
# Step 3: Make the data structure!

# Setup the entire data structure:
# based off of the notes you have above, create the
# and manually write in data presented in rides.csv
# You should be copying and pasting the literal data
# into this data structure, such as "DR0004"
# and "3rd Feb 2016" and "RD0022"
all_driver_info = {
    DR0001: [
        {
            date: "3rd Feb 2016",
            cost: 10,
            rider_id: "RD0003",
            rating: 3
        },

        {
            date: "3rd Feb 2016",
            cost: 30,
            rider_id: "RD0015",
            rating: 4
        },

        {
            date: "5th Feb 2016",
            cost: 45,
            rider_id: "RD0003",
            rating: 2
        }

    ],

    DR0002: [
        {
            date: "3rd Feb 2016",
            cost: 25,
            rider_id: "RD0073",
            rating: 5
        },

        {
            date: "4th Feb 2016",
            cost: 15,
            rider_id: "RD0013",
            rating: 1
        },

        {
            date: "5th Feb 2016",
            cost: 35,
            rider_id: "RD0066",
            rating: 3
        }

    ],

    DR0003: [
        {
            date: "4th Feb 2016",
            cost: 5,
            rider_id: "RD0066",
            rating: 5
        },

        {
            date: "5th Feb 2016",
            cost: 50,
            rider_id: "RD0003",
            rating: 2
        }
    ],

    DR0004: [
        {
            date: "3rd Feb 2016",
            cost: 5,
            rider_id: "RD0022",
            rating: 5
        },

        {
            date: "4th Feb 2016",
            cost: 10,
            rider_id: "RD0022",
            rating: 4
        },

        {
            date: "5th Feb 2016",
            cost: 20,
            rider_id: "RD0073",
            rating: 5
        }
    ]

}


########################################################
# Step 4: Total Driver's Earnings and Number of Rides

# Use an iteration blocks to print the following answers:
# - the number of rides each driver has given
# - the total amount of money each driver has made
# - the average rating for each driver
# - Which driver made the most money?
# - Which driver has the highest average rating?
puts "The number of rides each driver has given:"

def number_of_rides(all_driver_info)
  all_driver_info.each do |driver, ride|
    puts "#{driver}: #{ride.length}"
  end
end

number_of_rides(all_driver_info)

puts

puts "The total amount of money each driver has made:"

def revenue_each_driver(all_driver_info)
  rider_pay_sum = {}

  all_driver_info.each do |driver, ride|
    cost = ride.map do |key|
      key[:cost]
    end

    rider_pay_sum[driver] = cost.sum

  end

  return rider_pay_sum
end

rider_pay_sum = revenue_each_driver(all_driver_info)
rider_pay_sum.each do |driver, revenue|
  puts "#{driver}: $#{revenue}"
end


# rider_pay_sum = revenue_each_driver(all_driver_info)
# rider_pay_sum[:cost.each do |driver, revenue|
#   puts "#{driver}: $#{revenue}"
# end

puts

puts "The average rating for each driver:"

def average_rating(all_driver_info)
  average_ratings = {}
  all_driver_info.each do |driver, ride|

    rating = ride.map do |key|
      key[:rating]
    end

    average = (rating.sum.to_f) / rating.length

    average_ratings[driver] = average
  end
  return average_ratings
end

average_rating = average_rating(all_driver_info)
average_rating.each do |driver, rating|
  puts "#{driver}: #{sprintf("%.2f", rating)}"
end

average_rating(all_driver_info)

puts

puts "Which driver made the most money?"

def highest_earner(all_driver_info)
  rider_pay_sum = revenue_each_driver(all_driver_info)

  rider_pay_sum.each do |driver, income|
    puts driver if income == rider_pay_sum.values.max
  end
end

highest_earner(all_driver_info)

puts

puts "Which driver has the highest average rating?"

def highest_rating(all_driver_info)

  average_ratings = average_rating(all_driver_info)

  average_ratings.each do |driver, rating|
    puts driver if rating == average_ratings.values.max
  end
end

highest_rating(all_driver_info)
