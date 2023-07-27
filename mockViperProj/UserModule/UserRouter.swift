//
//  Router.swift
//  mockViperProj
//
//  Created by Виктор Коринь on 27.07.2023.
//

import Foundation
import UIKit

class UserRouter: AnyRouter {
    var navController: UINavigationController?
    
    var entry: EntryPoint?
    
    static func build(with userId: Int? = nil) -> AnyRouter {
        let router = UserRouter()
        
        // Assign VIP
        var view: AnyView = UserViewController()
        var presenter: AnyPresenter = UserPresenter()
        var interactor: AnyInteractor = UserInteractor()
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        
        router.entry = view as? EntryPoint
        
        return router
    }
    
    func route(to destionation: Module) {
        switch destionation {
        case .DetailModule(let userId):
            let detailRouter = DetailRouter.build(with: userId)
            guard let vc = detailRouter.entry else { return }
            navController?.pushViewController(vc, animated: true)
//            router = detailRouter
        default:
            break
        }
    }
}
