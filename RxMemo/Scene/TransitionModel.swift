//
//  TransitionModel.swift
//  RxMemo
//
//  Created by JEN Lee on 2021/09/08.
//

import Foundation

enum TransitionStyle {
    case root
    case push
    case modal
}

enum TransitionError: Error {
    case navigationControllerMissing
    case cannotPop
    case unknown
}
