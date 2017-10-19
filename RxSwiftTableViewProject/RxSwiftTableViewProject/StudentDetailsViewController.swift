//
//  StudentDetailsViewController.swift
//  RxSwiftTableViewProject
//
//  Created by dvt on 2017/10/19.
//  Copyright © 2017 dvt. All rights reserved.
//

import UIKit

class StudentDetailsViewController: UIViewController {

    @IBOutlet weak var studentFullNameLabel: UILabel!
    
    private var _student: Student!
    
    var student:Student {
        get{
            return _student
        }
        set{
            _student = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        studentFullNameLabel.text = "\(student.name) \(student.surname)"
    }

}
