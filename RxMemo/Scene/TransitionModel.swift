//
//  TransitionModel.swift
//  RxMemo
//
//  Created by Yeonku on 2021/06/20.
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
