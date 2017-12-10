//
//  MyActionFMDB.swift
//  StudyRxSwift
//
//  Created by 冨樫公一 on 2017/12/09.
//  Copyright © 2017年 冨樫公一. All rights reserved.
//

import FMDB

class MyActionFMDB: NSObject {
    private static let fileURL = try! FileManager.default
        .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        .appendingPathComponent("me_action")
    private static let filePath = "me_action"
    private var database = FMDatabase()

    private static let SQLCreate = "" +
        "CREATE TABLE IF NOT EXISTS books (" +
        "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
        "author TEXT, " +
        "title TEXT, " +
        "release_date INTEGER" +
    ");"
    func create() {
        database = FMDatabase(path: MyActionFMDB.filePath)
    }
    
    
    private static let SQLInsert = "" +
        "INSERT INTO " +
        "action (actionName, actionID, groupName, groupID, colorID) " +
        "VALUES " +
    "(?, ?, ?, ?, ?);"

    func add (actionName: String, actionID: String,
              groupName: String, groupID: String,
              colorID: String) {
        if self.database.executeUpdate(MyActionFMDB.SQLInsert,
                                 withArgumentsIn: [actionName, actionID, groupName, groupID, colorID]) {
            let bookId = database.lastInsertRowId()
            print("bookID: \(bookId)")
        }
    }
    
    private static let SQLSelect = "" +
        "SELECT " +
        "id, actionName, actionID, groupName, groupID, colorID " +
        "FROM " +
        "actions;" +
        "ORDER BY actionID"
    
    func read() -> Array<Any> {
        let ations = Array<Any>()
        if let results = self.database.executeQuery(MyActionFMDB.SQLSelect, withArgumentsIn: nil) {
            while results.next() {
                print("results: \(results)")
            }
        }
        return ations
    }
    
    //FIXME: example
//    func create() {
//        let database = FMDatabase(path: MyActionFMDB.filePath)
//
//        database?.executeUpdate(MyActionFMDB.SQLCreate, withArgumentsIn: nil)
//
//        //FIXME: test
//        do {
//            try database?.executeUpdate("create table test(x text, y text, z text)", values: nil)
//            try database?.executeUpdate("insert into test (x, y, z) values (?, ?, ?)", values: ["a", "b", "c"])
//            try database?.executeUpdate("insert into test (x, y, z) values (?, ?, ?)", values: ["e", "f", "g"])
//
//            let rs = try database?.executeQuery("select x, y, z from test", values: nil)
//            while (rs?.next())! {
//                if let x = rs?.string(forColumn: "x"), let y = rs?.string(forColumn: "y"), let z = rs?.string(forColumn: "z") {
//                    print("x = \(x); y = \(y); z = \(z)")
//                }
//            }
//        } catch {
//            print("failed: \(error.localizedDescription)")
//        }
//
//        database?.close()
//    }
}
