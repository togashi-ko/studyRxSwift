//
//  TopViewController.swift
//  StudyRxSwift
//
//  Created by 冨樫公一 on 2017/11/19.
//  Copyright © 2017年 冨樫公一. All rights reserved.
//

import UIKit
import Firebase
import RxSwift


class TopViewController: UIViewController, UITableViewDelegate, SelectActionViewDelegate {

    @IBOutlet weak var ownDidTableView: UITableView!
    @IBOutlet weak var userActionView: UIView!
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
//        let selectActionView = SelectActionView(frame:userActionView.frame)
//        userActionView.addSubview(selectActionView)
        //FIXME:test
        setUpLayout(isModeSelect: true)
        // Do any additional setup after loading the view, typically from a nib.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func bind() {
        MainViewModel.sharedInstance.modeSelect.asObservable().subscribe(onNext: { [weak self] x in
            self?.setUpLayout(isModeSelect:x)
        }).disposed(by: disposeBag)
        
        MainViewModel.sharedInstance.myActionList.asObservable().subscribe(onNext: { x in
            print("myActionList: \(x)")
            //FIXME: tableViewReload
        }).disposed(by: disposeBag)
        

    }
    
    private func setUpLayout(isModeSelect: Bool) {
//        if isModeSelect {
        let rect = CGRect(x: 0, y: 0,
                          width: UIScreen.main.bounds.width,
                          height: UIScreen.main.bounds.height)
            let selectActionView = SelectActionView(frame:rect)
            selectActionView.delegate = self
            userActionView.addSubview(selectActionView)
//        userActionView = selectActionView
        
//        }
    }
    
    func removeAction() {
        
        
    }
    
    func addAction() {
        
    }
    
}

