//
//  SceneCoordinator.swift
//  RxMemo
//
//  Created by JEN Lee on 2021/09/09.
//

import Foundation
import RxSwift
import RxCocoa


//화면 전환 담당
class SceneCoordinator: SceneCoordinatorType {
    
    private let bag = DisposeBag()
    private var window: UIWindow
    private var currentVC: UIViewController
    
    required init(window: UIWindow) {
        self.window = window
        currentVC = window.rootViewController!
    }
    
    @discardableResult
    func transtion(to scene: Scene, using style: TransitionStyle, animated: Bool) -> Completable {
        <#code#>
    }
    
    
    @discardableResult
    func close(animated: Bool) -> Completable {
        <#code#>
    }
    
    
}
