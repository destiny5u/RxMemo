//
//  MemosViewModel.swift
//  RxMemo
//
//  Created by Yeonku on 2021/06/19.
//

import Foundation
import RxSwift
import RxCocoa

class MemosViewModel: CommonViewModel {
    var memos: Observable<[Memo]> {
        return storage.memoList()
    }
}
