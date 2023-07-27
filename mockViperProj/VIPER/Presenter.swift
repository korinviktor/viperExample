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

enum FetchingError: Error {
    case failed 
}

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
    var interactor: AnyInteractor? {
        didSet {
            if let interactor = interactor as? UserInteractor {
                interactor.getUsers()
            }
        }
    }
    var view: AnyView?
    
    func interactorDidFetchUsers(with result: Result<[User], Error>) {
        guard let view = view as? UserViewProtocol else { return }
        switch result {
        case .success(let users):
            view.update(with: users)
        case .failure:
            view.update(with: "Error")
        }
    }
}
