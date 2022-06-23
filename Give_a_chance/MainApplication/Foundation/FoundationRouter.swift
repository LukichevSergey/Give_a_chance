//
//  FoundationRouter.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 22.06.2022.
//  
//

import Foundation

// MARK: Protocol - FoundationPresenterToRouterProtocol (Presenter -> Router)
protocol FoundationPresenterToRouterProtocol: AnyObject {

}

class FoundationRouter {

    // MARK: Properties
    weak var view: FoundationRouterToViewProtocol!
}

// MARK: Extension - FoundationPresenterToRouterProtocol
extension FoundationRouter: FoundationPresenterToRouterProtocol {
    
}