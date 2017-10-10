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
        handleModelTapped()
        handleCellTapped()
    }
    func setupUI(){
        students.bindTo(tableView.rx.items(cellIdentifier: "studentCell", cellType: StudentCell.self)){
            (_, student, cell) in
                cell.tag = 0
                cell.textLabel?.text = student.name
        }.addDisposableTo(disposeBag)
    }
    
    func handleModelTapped(){
        tableView.rx.modelSelected(Student.self).subscribe(onNext: {
            student in
            print("\(student.name) has surname : \(student.surname)")
        })
        .addDisposableTo(disposeBag)
    }
    
    func handleCellTapped(){
        tableView.rx.itemSelected.subscribe(onNext : {
            [weak self] indexPath in
            if let cell = self?.tableView.cellForRow(at: indexPath) as? StudentCell {
                self?.updateCell(cell: cell)
            }
        })
        .addDisposableTo(disposeBag)
    }
    
}
extension ViewController{
    func updateCell(cell: UITableViewCell){
        if cell.tag == 0 {
            cell.backgroundColor = UIColor.blue.withAlphaComponent(0.6)
            cell.tag = 1
        }else if cell.tag == 1 {
            cell.backgroundColor = UIColor.white
            cell.tag = 0
        }
    }
}

