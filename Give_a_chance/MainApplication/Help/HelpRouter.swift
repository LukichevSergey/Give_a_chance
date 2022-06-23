//
//  HelpRouter.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 22.06.2022.
//  
//

import Foundation

// MARK: Protocol - HelpPresenterToRouterProtocol (Presenter -> Router)
protocol HelpPresenterToRouterProtocol: AnyObject {

}

class HelpRouter {

    // MARK: Properties
    weak var view: HelpRouterToViewProtocol!
}

// MARK: Extension - HelpPresenterToRouterProtocol
extension HelpRouter: HelpPresenterToRouterProtocol {
    
}