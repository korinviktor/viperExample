//
//  Interactor.swift
//  mockViperProj
//
//  Created by Виктор Коринь on 27.07.2023.
//

import Foundation

//object
//protocol
//ref to presenter


//endpoint

protocol AnyInteractor {
    var presenter: AnyPresenter? { get set }
}

protocol UserInteractorProtocol: AnyInteractor {
    func getUsers()
}


class UserInteractor: UserInteractorProtocol {
    var presenter: AnyPresenter?
    
    func getUsers() {
        
    }
}
