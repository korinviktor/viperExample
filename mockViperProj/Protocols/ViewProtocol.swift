//
//  ViewProtocol.swift
//  mockViperProj
//
//  Created by Виктор Коринь on 27.07.2023.
//

import Foundation
import UIKit
// ViewController
// protocol
// reference presenter

protocol AnyView {
    var presenter: AnyPresenter? { get set }
}
