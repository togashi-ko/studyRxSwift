//
//  MainViewModel.swift
//  StudyRxSwift
//
//  Created by 冨樫公一 on 2017/12/04.
//  Copyright © 2017年 冨樫公一. All rights reserved.
//

import RxSwift
import RxCocoa
import FMDB

class MainViewModel {
    public let modeSelect = Variable(true)
    public let myActionDB = MyActionFMDB()
//    public private(set) var myActionList: Array<Any>
    public var myActionList = Variable(Array<Any>())
    
    static var sharedInstance: MainViewModel = {
        return MainViewModel()
    }()
    private init() {
        myActionDB.create()
        myActionList.value = myActionDB.read()
        modeSelect.value = true
        bind()
    }

    private func bind() {

    }

    //TODO: ObjectMapper
    private func addAction(actionName: String,
                           actionID: String,
                           groupName: String,
                           groupID: String,
                           colorID: String) {
        
        myActionDB.add(actionName: actionName,
                       actionID: actionID,
                       groupName: groupName,
                       groupID: groupID,
                       colorID: colorID)
    }
    
    //TODO: ObjectMapper
    private func readAction() {
        myActionList.value = myActionDB.read()
    }
}

