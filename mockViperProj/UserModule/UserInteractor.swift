//
//  Interactor.swift
//  mockViperProj
//
//  Created by Виктор Коринь on 27.07.2023.
//

import Foundation

protocol UserInteractorProtocol: AnyInteractor {
    func getUsers()
}

class UserInteractor: UserInteractorProtocol {
    var presenter: AnyPresenter?
    
    func getUsers() {
        guard let root = URL(string: Environment.apiURL),
              let url = URL(string: "users", relativeTo: root),
              let presenter = presenter as? UserPresenterProtocol
        else { return }
        
        let req = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: req) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                presenter.interactorDidFetchUsers(with: .failure(FetchingError.failed))
                return
            }
            
            do {
                let userEntities = try JSONDecoder().decode([User].self, from: data)
                presenter.interactorDidFetchUsers(with: .success(userEntities))
            } catch {
                presenter.interactorDidFetchUsers(with: .failure(error))
            }
        }
        task.resume()
    }
}
