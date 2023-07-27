//
//  RouterProtocol.swift
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
    
    var navController: UINavigationController? { get set }
    
    static func build(with userId: Int?) -> AnyRouter
    
    func route(to destionation: Module)
}
