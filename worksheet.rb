# Step 1: Establish the layers

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
puts "The number of rides each driver has given:"

all_driver_info.each do |driver, ride| 
  puts "#{driver}: #{ride.length}"
end 

puts

puts "The total amount of money each driver has made:"

rider_pay_sum = {}

all_driver_info.each do |driver, ride| 
  print driver

  cost = ride.map do |key| 
    key[:cost]
  end

  puts ": $#{cost.sum}"

  rider_pay_sum[driver] = cost.sum
end 

puts

puts "The average rating for each driver:"
average_ratings = {}

all_driver_info.each do |driver, ride| 
  print driver

  rating = ride.map do |key| 
    key[:rating]
  end

  average = (rating.sum) / rating.length

  puts ": #{average}"

  average_ratings[driver] = average
end 

puts

puts "Which driver made the most money?" 
rider_pay_sum.each { |driver, income| puts driver if income == rider_pay_sum.values.max } 

puts

puts "Which driver has the highest average rating?"
average_ratings.each { |driver, rating| puts driver if rating == average_ratings.values.max } 
