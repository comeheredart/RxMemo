//
//  MemoStorageType.swift
//  RxMemo
//
//  Created by JEN Lee on 2021/09/08.
//

import Foundation
import RxSwift

protocol MemoStorageType {
    //CRUD
    
    //작업 결과가 필요없는 경우를 위해
    @discardableResult
    func createMemo(content: String) -> Observable<Memo>
    
    @discardableResult
    func memoList() -> Observable<[Memo]>
    
    @discardableResult
    func update(memo: Memo, content: String) -> Observable<Memo>
    
    @discardableResult
    func delete(memo: Memo) -> Observable<Memo>
    
}
