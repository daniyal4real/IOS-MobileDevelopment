import Foundation

// PROTOCOL
protocol Studying {
    var mathFinalMark: Int { get set }
    var englishFinalMark: Int { get set }
    var mobileDevFinalMark: Int { get set }
    var javaFinalMark: Int { get set }
    var totalCreditsNumber: Int { get set }
    
    func countTotalGPA(mathFinalMark: Int, englishFinalMark: Int, mobileDevFinalMark: Int, javaFinalMark: Int, totalCreditsNumber: Int) -> Double
    
    func findStatusByGPA(name: String, averageGPA: Double) -> String
    
    func countGPABySubject(markPercentage: Int, subjectCreditNumber: Int) -> Double
}


// STRUCT STUDENT
struct Student: Studying{
    
    var name: String
    
    var mathFinalMark: Int
    
    var englishFinalMark: Int
    
    var mobileDevFinalMark: Int
    
    var javaFinalMark: Int
    
    var totalCreditsNumber: Int

    // COMPUTED PROPERTY IS USED TO SEE THE AVERAGE/TOTAL GPA OF STUDENT
    var totalGPA: Double {
        get {
            return countTotalGPA(mathFinalMark: mathFinalMark.self, englishFinalMark: englishFinalMark.self, mobileDevFinalMark: mobileDevFinalMark.self, javaFinalMark: javaFinalMark.self, totalCreditsNumber: totalCreditsNumber.self)
        }
    }
    
    // OBSERVER PROPERTY IS USED TO CHECK THE DIFFERENCE OF STUDENT'S GPA IN DIFFERENT SEMESTERS
    var gpaStatus: Double = 0{
        willSet (averageGPA) {
            let averageGPA = totalGPA
            let result = String(format: "%.2f", averageGPA)
            if averageGPA < 3.6{
                print("You should study harder, GPA: \(result)")
            }
        }
        didSet {
            if gpaStatus > 3.6 {
                print("The next trimester, GPA: \(gpaStatus), Best student")
            }
        }
    }

    // FUNCTION TO CALCULATE THE TOTAL/AVERAGE GPA
    func countTotalGPA(mathFinalMark: Int, englishFinalMark: Int, mobileDevFinalMark: Int, javaFinalMark: Int, totalCreditsNumber: Int) -> Double {
        let gpaMath = countGPABySubject(markPercentage: mathFinalMark, subjectCreditNumber: 5)
        let gpaEnglish = countGPABySubject(markPercentage: englishFinalMark, subjectCreditNumber: 4)
        let gpaMobileDev = countGPABySubject(markPercentage: mobileDevFinalMark, subjectCreditNumber: 5)
        let gpaJava = countGPABySubject(markPercentage: javaFinalMark, subjectCreditNumber: 6)
        
        let totalSum = gpaMath + gpaEnglish + gpaMobileDev + gpaJava
        
        let totalGPA = totalSum/Double(totalCreditsNumber)

        return totalGPA
    }
    
    // THE MAIN WAY IS BY OBSERVER PROPERTY ON THE UPPER SIDE
    // THIS IS THE ADDITIONAL FUNCTION TO CHECK WHETHER THE STUDENT IS SUCCESSFULL, OR HE NEEDS TO STUDY HARDE
    func findStatusByGPA(name: String, averageGPA: Double) -> String {
        if averageGPA > 3.6 {
            return "\(name), best student"
        }else {
            return "\(name), you should study harder next semester"
        }
    }
    
    
    // FUNCTION IS USED TO CONVERT THE FINAL MARK THAT ARE USUALLY IN 100 POINTS OR PERCENTS TO GPA BAND
    func countGPABySubject(markPercentage: Int, subjectCreditNumber: Int) -> Double{
        var gpaPerSubject: Double = 0
        if markPercentage >= 95{
            gpaPerSubject = 4.0
        }else if markPercentage >= 90 && markPercentage < 95{
            gpaPerSubject = 3.67
        }else if markPercentage >= 85 && markPercentage < 90{
            gpaPerSubject = 3.33
        }else if markPercentage >= 80 && markPercentage < 85{
            gpaPerSubject = 3.0
        }else if markPercentage >= 75 && markPercentage < 80{
            gpaPerSubject = 2.67
        }else if markPercentage >= 70 && markPercentage < 75{
            gpaPerSubject = 2.33
        }else if markPercentage >= 65 && markPercentage < 70{
            gpaPerSubject = 2.0
        }else if markPercentage >= 60 && markPercentage < 65{
            gpaPerSubject = 1.67
        }else if markPercentage >= 55 && markPercentage < 60{
            gpaPerSubject = 1.33
        }else if markPercentage >= 50 && markPercentage < 55{
            gpaPerSubject = 1.0
        }else {
            gpaPerSubject = 0
        }
        
        return gpaPerSubject * Double(subjectCreditNumber)
    }
}

// EXAMPLE OF ONE STUDENT
var student1 = Student(name: "Daniyal Ganiuly", mathFinalMark: 83, englishFinalMark: 91, mobileDevFinalMark: 90, javaFinalMark: 86, totalCreditsNumber: 20)

// ONE MORE EXAMPLE WITH ANOTHER STUDENT
var student2 = Student(name: "John Adams", mathFinalMark: 70, englishFinalMark: 60, mobileDevFinalMark: 85, javaFinalMark: 89, totalCreditsNumber: 20)

print("\(student1.name)'s GPA is: \(String(format: "%.2f", student1.totalGPA))")
student1.gpaStatus = 3.9

print("")
print("\(student2.name)'s GPA is: \(String(format: "%.2f", student2.totalGPA))")
print(student2.findStatusByGPA(name: student2.name, averageGPA: student2.totalGPA))



