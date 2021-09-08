//
//  ViewModelBindableType.swift
//  RxMemo
//
//  Created by JEN Lee on 2021/09/08.
//

import UIKit

protocol ViewModelBindableType {
    //https://zeddios.tistory.com/382
    associatedtype ViewModelType
    
    var viewModel: ViewModelType! { get set }
    func bindViewModel()
    
}


extension ViewModelBindableType where Self: UIViewController {
    //뷰 컨에 추가된 뷰모델의 속성의 실제 뷰모델을 정의, bind 메소드 자동호출
    mutating func bind() {
        
        self.viewModel = viewModel
        loadViewIfNeeded()
        
        bindViewModel()
    }
}
