Article.delete_all
Batch.delete_all
Prediction.delete_all
Score.delete_all
WeekResult.delete_all
User.delete_all

@user = User.create(username: "admin", password: "admin")
Batch.create_all_weeks_for_new_user(@user)