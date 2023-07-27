//
//  Presenter.swift
//  mockViperProj
//
//  Created by Виктор Коринь on 27.07.2023.
//

import Foundation


//Object
//protocol
//ref to interactor, router, view 

protocol AnyPresenter {
    var router: AnyRouter? { get set }
    var interactor: AnyInteractor? { get set }
    var view: AnyView? { get set }
    
}

protocol UserPresenterProtocol: AnyPresenter {
    func interactorDidFetchUsers(with result: Result<[User], Error>)
}

class UserPresenter: UserPresenterProtocol {
    var router: AnyRouter?
    var interactor: AnyInteractor?
    var view: AnyView?
    
    func interactorDidFetchUsers(with result: Result<[User], Error>) {
        
    }
}
