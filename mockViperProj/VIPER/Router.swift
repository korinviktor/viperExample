//
//  Router.swift
//  mockViperProj
//
//  Created by Виктор Коринь on 27.07.2023.
//

import Foundation
import UIKit

// Object
// Entry point

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    var entry: EntryPoint? { get }
    
    static func start() -> AnyRouter
}

class UserRouter: AnyRouter {
    var entry: EntryPoint?
    
    static func start() -> AnyRouter {
        let router = UserRouter()
        
        // Assign VIP
        var view: AnyView = UserViewController()
        var interactor: AnyInteractor = UserInteractor()
        var presenter: AnyPresenter = UserPresenter()
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.router = router
        
        router.entry = view as? EntryPoint
        
        return router
    }
    
     
}
