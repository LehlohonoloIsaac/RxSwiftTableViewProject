//
//  Student.swift
//  RxSwiftTableViewProject
//
//  Created by dvt on 2017/10/10.
//  Copyright © 2017 dvt. All rights reserved.
//

import Foundation

struct Student {
    let name: String
    let surname: String
    
    
    static let myStudents: Array<Student> = {
        var students:Array<Student> = [Student]()
        for i in 0...20 {
            students.append(Student(name: "name\(i)", surname: "surname\(i)"))
        }
        return students
    }()
    
    
}
