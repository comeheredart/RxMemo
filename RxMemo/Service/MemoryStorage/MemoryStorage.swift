//
//  MemoryStorage.swift
//  RxMemo
//
//  Created by JEN Lee on 2021/09/08.
//

import Foundation
import RxSwift

//배열을 변경한 뒤 BehaviorSubject 에서 새로운 넥스트 이벤트를 방출하는 패턴.
//나중에 BehaviorSubject를 테이블 뷰 와 바인딩, 정보가 업데이트 된다.

class MemoryStorage: MemoStorageType {
    //메모리에 메모를 저장하는 클래스
    
    private var list = [
        Memo(content: "Hello, RxSwift", insertDate: Date().addingTimeInterval(-10)),
        Memo(content: "ddd", insertDate: Date().addingTimeInterval(-20))
    ]
    //이 배열은 Observable을 통해 외부로 공개된다.
    //그리고 Observable은 배열의 상태가 업데이트되면 next 이벤트 방출.
    //그냥 Observable이 이 동작을 하려니까 subject로 만들어야하겠다!
    
    private lazy var store = BehaviorSubject<[Memo]>(value: list)
    
    @discardableResult
    func createMemo(content: String) -> Observable<Memo> {
        let memo = Memo(content: content)
        list.insert(memo, at: 0)
        
        //subject 에서 새로운 넥스트 이벤트를 방출하고
        store.onNext(list)
        
        //새로운 메모를 방출하는 옵저버블 리턴
        return Observable.just(memo)
        
    }
    
    @discardableResult
    func memoList() -> Observable<[Memo]> {
        return store
    }
    
    @discardableResult
    func update(memo: Memo, content: String) -> Observable<Memo> {
        let updated = Memo(original: memo, updatedContent: content)
        
        if let index = list.firstIndex(where: { $0 == memo }) {
            list.remove(at: index)
            list.insert(updated, at: index)
        }
        
        store.onNext(list)
        
        
        return Observable.just(updated)
        
    }
    
    @discardableResult
    func delete(memo: Memo) -> Observable<Memo> {
        if let index = list.firstIndex(where: { $0 == memo}) {
            list.remove(at: index)
        }
        
        store.onNext(list)
        
        return Observable.just(memo)
    }
    
    
}
