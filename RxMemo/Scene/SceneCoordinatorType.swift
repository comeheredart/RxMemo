//
//  SceneCoordinatorType.swift
//  RxMemo
//
//  Created by JEN Lee on 2021/09/09.
//

import Foundation
import RxSwift

protocol SceneCoordinatorType {
    @discardableResult
    func transtion(to scene: Scene, using style: TransitionStyle, animated: Bool) -> Completable
    
    @discardableResult
    func close(animated: Bool) -> Completable 
}
