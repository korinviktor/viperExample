//
//  DetailRouter.swift
//  mockViperProj
//
//  Created by Виктор Коринь on 27.07.2023.
//

import Foundation
import UIKit

class DetailRouter: AnyRouter {
    var navController: UINavigationController?
    
    var entry: EntryPoint?
    
    static func build(with userId: Int?) -> AnyRouter {
        let router = DetailRouter()
        
        //Assign VIP
        var view: AnyView = DetailViewController()
        var presenter: AnyPresenter = DetailPresenter(userId: userId)
        var interactor: AnyInteractor = DetailInteractor()
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        
        router.entry = view as? EntryPoint
        
        return router
    }
    
    func route(to destionation: Module) {
//        return DetailRouter()
    }
}
