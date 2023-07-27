//
//  InteractorProtocol.swift
//  mockViperProj
//
//  Created by Виктор Коринь on 27.07.2023.
//

import Foundation
//object
//protocol
//ref to presenter

protocol AnyInteractor {
    var presenter: AnyPresenter? { get set }
}
