//
//  DetailPresenter.swift
//  mockViperProj
//
//  Created by Виктор Коринь on 27.07.2023.
//

import Foundation

protocol DetailPresenterProtocol: AnyPresenter {
    func interactorDidFetchUserPosts(with result: Result<[Post], Error>)
}

class DetailPresenter: DetailPresenterProtocol {
    var view: AnyView?
    
    var router: AnyRouter?
    
    var userId: Int?
    
    init(userId: Int?) {
        self.userId = userId
    }
    
    var interactor: AnyInteractor? {
        didSet {
            if let interactor = interactor as? DetailInteractorProtocol {
                interactor.getInfo(userId: userId)
            }
        }
    }
    
    func interactorDidFetchUserPosts(with result: Result<[Post], Error>) {
        guard let view = view as? DetailViewProtocol else { return }
        switch result {
        case .success(let posts):
            view.update(with: posts)
        case .failure:
            view.update(with: "PostError")
        }
    }
    
}
