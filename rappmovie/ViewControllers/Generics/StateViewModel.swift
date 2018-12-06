//
//  StateViewModel.swift
//  rappmovie
//
//  Created by Restorando on 12/5/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import Foundation
import RxSwift

class StateViewModel {

    // MARK: - StateViewModel State

    enum State {
        case initial
        case loading
        case error
        case success([Section])
    }

    // MARK: - Public Properties

    var state: Variable<State> = Variable(.initial)
    var disposeBag = DisposeBag()

    let apiStore = APIStore()
}
