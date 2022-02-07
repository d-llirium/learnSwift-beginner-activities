/*:
 ## Structures
 
 ### Structured Gym Regimen
 
 Exercise:
 
 We’ll first create a structure for our exercises. We’ll use this structure to keep track of:

 its name.
 what muscle groups it targets.
 how many repetitions (reps) we should do in one go.
 how many rounds of repetitions we should do (sets).
 How many total reps we’ll be doing.
 Another structure we’ll need to keep track of all these exercises is for our regimen! This structure will:

 track the day of the week.
 store the exercises we should do for a given day.
 include a method to remind us of a given day’s workout regimen.
 Are you ready to work this out? 🏋️‍♀️
 
 */
import Foundation

// Write your code below 💪
struct Exercise{
  var name: String
  var muscleGroups: [String]
  var reps: Int
  var sets: Int
  var totalReps: Int
  init(name: String, muscleGroups: [String], reps: Int, sets: Int){
    self.name = name
    self.muscleGroups = muscleGroups
    self.reps = reps
    self.sets = sets
    self.totalReps = reps * sets
  }
}
struct Regimen{
  var dayOfWeek: String
  var exercises: [Exercise]
  init(dayOfWeek: String, exercises: [Exercise]){
    self.dayOfWeek = dayOfWeek
    self.exercises = exercises
  }
  func printExercisePlan(){
    print("Today is \(self.dayOfWeek) and the plan is to:")
    for exercise in self.exercises{
      print("Do \(exercise.sets) sets of \(exercise.reps) \(exercise.name)")
      print("That's a total of \(exercise.totalReps) \(exercise.name)")
    }
    print("=========================")
  }
  mutating func addExercise(exercises:[Exercise]){
    self.exercises += exercises
  }
  mutating func changeDayOfTheWeek(_ dayOfWeek: String){
    self.dayOfWeek = dayOfWeek
  }
}
var pushUp = Exercise(name: "Push up", muscleGroups: ["Triceps", "Chest", "Shoulders"], reps: 10, sets: 3)
var sitUp = Exercise(name: "Sit up", muscleGroups: ["Triceps", "Chest", "Shoulders"], reps: 5, sets: 3)
var squat = Exercise(name: "Squat", muscleGroups: ["Triceps", "Chest", "Shoulders"], reps: 15, sets: 3)

var mondayRegimen = Regimen(dayOfWeek: "Monday", exercises: [pushUp])

var tuesdayRegimen = mondayRegimen
tuesdayRegimen.changeDayOfTheWeek("Tuesday")
tuesdayRegimen.addExercise(exercises: [sitUp])

var wednesdayRegimen = mondayRegimen
wednesdayRegimen.changeDayOfTheWeek("Wednesday")
wednesdayRegimen.addExercise(exercises: [sitUp, squat])


mondayRegimen.printExercisePlan()
tuesdayRegimen.printExercisePlan()
wednesdayRegimen.printExercisePlan()
/*:
 OUTPUT:
 
 Today is Monday and the plan is to:
 Do 3 sets of 10 Push up
 That's a total of 30 Push up
 =========================
 Today is Tuesday and the plan is to:
 Do 3 sets of 10 Push up
 That's a total of 30 Push up
 Do 3 sets of 5 Sit up
 That's a total of 15 Sit up
 =========================
 Today is Wednesday and the plan is to:
 Do 3 sets of 10 Push up
 That's a total of 30 Push up
 Do 3 sets of 5 Sit up
 That's a total of 15 Sit up
 Do 3 sets of 15 Squat
 That's a total of 45 Squat
 =========================

 */
//: [< Previous](@previous) | [Next: Properties And Access Control](@next)

