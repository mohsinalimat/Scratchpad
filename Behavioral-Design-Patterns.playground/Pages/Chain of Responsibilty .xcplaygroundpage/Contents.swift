//: [Previous](@previous)

/// # Chain of Responsibilty 

import Foundation

// Skill Level
enum Skill: Int {
    case Beginner = 1
    case Junior
    case Apprentice
    case MasterMechanic
}

// A Job that needs to be done
class Job {
    let minimumSkillSet: Skill
    let name: String
    var completed: Bool = false
    
    init(minimumSkillSet: Skill, name: String) {
        self.minimumSkillSet = minimumSkillSet
        self.name = name
    }
}


class Mechanic {
    let skill: Skill
    var name : String
    var isBusy: Bool = false
    
    init(skill:Skill, name: String) {
        self.skill = skill
        self.name = name
    }
    
    func performJob(job: Job) -> Bool {
        if job.minimumSkillSet > self.skill || isBusy = true {
            assert(false,"Mechanic is busy or insuffisently")
        } else {
            isBusy = true
            job.completed = true
            return true
        }
    }
}

//: [Next](@next)
