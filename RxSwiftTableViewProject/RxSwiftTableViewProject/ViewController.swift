//
//  ViewController.swift
//  RxSwiftTableViewProject
//
//  Created by dvt on 2017/10/10.
//  Copyright © 2017 dvt. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let students = Observable.just(Student.myStudents)
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    func setupUI(){
        students.bindTo(tableView.rx.items(cellIdentifier: "studentCell", cellType: StudentCell.self)){
            (_, student, cell) in
                cell.textLabel?.text = student.name
        }.addDisposableTo(disposeBag)
    }
}

