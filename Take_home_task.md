# Task

## Summary

We would like you to create a basic person matching and recommendation engine based on 4 categories - gender, distance, diet type and age.

## Detail

Say we have two people:

* `{"id": 1, "name": "person a", "gender": "male", "location": "0,0", "diet_type": "vegan", "age": 25}`
* `{"id": 2, name": "person b", "gender": "female", "location": "0,0", "diet_type": "vegan", "age": 23}`

If `user={"id": 1}` has the following preferences: 
`looking_for={"looking_for_diet_type": "vegan", "ages": "20-30", "distance": "5 miles", "gender": "female"}`
we would expect them to be recommended with `user={"id": 2}` and `user={"id": 1}` can place a like on that user.

If both users like each other they will be matched with each other. Feel free to structure the like and match 
data structures as you feel fit, but they must contain the following basic information 
(these can be extrapolated into multiple data structures):

* `like={"user_id": int, "liked_user_id": int, "created_at": datetime}`
* `match={"user_id": int, "matched_user_id": int, "created_at": datetime}`

## Notes

* Spend as much or as little time on this as you want, we would like to see some runnable code or a live api if possible.
* Feel free to use whatever technology you feel is suitable, we use Go with MariaDB here at Grazer so would prefer to see 
  solutions using these but feel free to use whatever technologies you are most comfortable in.

## Tips

* Please don't do anything platform specific (for example using Windows only external libraries).
* Please include a DESIGN.md Markdown document describing why you made the design choices you did, and alternative
  designs you considered and why they were not chosen. If you've used any external libraries, please justify their use.
* Comments would be appreciated but do not need to be excessive if your code is clear. Don't comment every line.

## Help
If you think you've found an error in the tests, or you have any further questions regarding the exercise, please get in touch.

## Sharing
Please don't share this exercise publicly.