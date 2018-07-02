//
//  UserDB.swift
//  JXFMDBHelper_Example
//
//  Created by 杜进新 on 2018/7/2.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import Foundation
import JXFMDBHelper

private let dbName = "UserDB"

class UserDB: BaseDB {
    
    static let shareInstance = UserDB(name: dbName)
    
    
    override init(name: String) {
        super.init(name: name)
    }
    
    func appendWallet(data:Dictionary<String,Any>, key address:String) -> Bool {
        let cs = "address = '\(address)'"
        if let dataArray = self.selectData(keys: [], condition: [cs]),dataArray.isEmpty == false {
            return false
        } else {
            return self.insertData(data: data)
        }
    }
    func deleteWallet(key address:String) -> Bool {
        let cs = "address = '\(address)'"
        return self.deleteData(condition: [cs])
    }
    func getDefaultWallet() -> Dictionary<String,Any>? {
        if self.manager.isExist == false {
            return nil
        }
        if
            let data = self.selectData(keys: [], condition: ["isDefault = \(1)"]),
            data.isEmpty == false,
            let dict = data[0] as? Dictionary<String,Any>{
            return dict
        }
        if
            let data = self.selectData(),
            data.isEmpty == false,
            let dict = data[0] as? Dictionary<String,Any> {
            
            return dict
        }
        return nil
    }
    func setDefaultWallet(key address:String) -> Bool {
        let cs = "address = '\(address)'"
        //先重置
        let isSuccess1 = self.updateData(keyValues: ["isDefault":0], condition: [])
        //再设置
        if isSuccess1 {
            let isSuccess2 = self.updateData(keyValues: ["isDefault":1], condition: [cs])
            if isSuccess2 {
                //userModel.UserName = name
            }
            return isSuccess2
        }
        return false
    }
}
