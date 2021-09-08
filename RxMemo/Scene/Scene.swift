//
//  Scene.swift
//  RxMemo
//
//  Created by JEN Lee on 2021/09/08.
//

import UIKit

enum Scene {
    case list(MemoListViewModel)
    case detail(MemoDetailViewModel)
    case compose(MemoComposeViewModel)
}


extension Scene {
    func instantiate(from storyboard: String = "Main") -> UIViewController {
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        
        switch self {
        case .list(let viewModel):
            guard let nav = storyboard.instantiateViewController(identifier: "ListNav") as? UINavigationController else {
                fatalError()
            }
        default:
            <#code#>
        }
    }
}


