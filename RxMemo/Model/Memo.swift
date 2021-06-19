//
//  Memo.swift
//  RxMemo
//
//  Created by Yeonku on 2021/06/19.
//

import Foundation

struct Memo: Equatable {
    var content: String
    var insertDate: Date
    var idetity: String
    
    init(content: String, insertDate: Date = Date()) {
        self.content = content
        self.insertDate = insertDate
        self.idetity = "\(insertDate.timeIntervalSinceReferenceDate)"
    }
    
    init(original: Memo, updatedContent: String) {
        self = original
        self.content = updatedContent
    }
}
