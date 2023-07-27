//
//  DetailInteractor.swift
//  mockViperProj
//
//  Created by Виктор Коринь on 27.07.2023.
//

import Foundation

protocol DetailInteractorProtocol: AnyInteractor {
    func getInfo(userId: Int?)
}

class DetailInteractor: DetailInteractorProtocol {
    var presenter: AnyPresenter?
    
    func getInfo(userId: Int?) {
        guard var urlComponents = URLComponents(string: Environment.apiURL + "/posts"),
              let presenter = presenter as? DetailPresenterProtocol,
              let id = userId
        else { return }
        urlComponents.queryItems = [
            URLQueryItem(name: "userId", value: String(id))
        ]
        if let url = urlComponents.url {
            let req = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: req) { [weak self] data, _, error in
                guard let data = data, error == nil else {
                    presenter.interactorDidFetchUserPosts(with: .failure(FetchingError.failed))
                    return
                }
                
                do {
                    let detailEntities = try JSONDecoder().decode([Post].self, from: data)
                    presenter.interactorDidFetchUserPosts(with: .success(detailEntities))
                } catch {
                    presenter.interactorDidFetchUserPosts(with: .failure(error))
                }
            }
            task.resume()
        }
    }
}
