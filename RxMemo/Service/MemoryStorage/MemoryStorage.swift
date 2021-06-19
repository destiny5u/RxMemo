//
//  MemoryStorage.swift
//  RxMemo
//
//  Created by Yeonku on 2021/06/19.
//

import Foundation
import RxSwift

class MemoryStorage: MemoStorageType {
    private var memos = [
        Memo(content: "Hello, RxSwift", insertDate: Date().addingTimeInterval(-10)),
        Memo(content: "Lorem Ipsum", insertDate: Date().addingTimeInterval(-20))
    ]
    
    private lazy var store = BehaviorSubject<[Memo]>(value: memos)
    
    @discardableResult
    func createMemo(content: String) -> Observable<Memo> {
        let memo = Memo(content: content)
        memos.insert(memo, at: 0)
        
        store.onNext(memos)
        
        return Observable.just(memo)
    }
    
    @discardableResult
    func memoList() -> Observable<[Memo]> {
        return store
    }
    
    @discardableResult
    func update(memo: Memo, content: String) -> Observable<Memo> {
        let updated = Memo(original: memo, updatedContent: content)
        
        if let index = memos.firstIndex(where: { $0 == memo }) {
            memos.remove(at: index)
            memos.insert(updated, at: index)
        }
        
        store.onNext(memos)
        
        return Observable.just(updated)
    }
    
    @discardableResult
    func delete(memo: Memo) -> Observable<Memo> {
        if let index = memos.firstIndex(where: { $0 == memo}) {
            memos.remove(at: index)
        }
        
        store.onNext(memos)
        
        return Observable.just(memo)
    }
}
