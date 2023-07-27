//
//  Presenter.swift
//  mockViperProj
//
//  Created by Виктор Коринь on 27.07.2023.
//

import Foundation

protocol UserPresenterProtocol: AnyPresenter {
    func interactorDidFetchUsers(with result: Result<[User], Error>)
}

class UserPresenter: UserPresenterProtocol {
    var router: AnyRouter?
    var interactor: AnyInteractor? {
        didSet {
            if let interactor = interactor as? UserInteractorProtocol {
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
