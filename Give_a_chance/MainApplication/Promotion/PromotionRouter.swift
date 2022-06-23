//
//  PromotionRouter.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 22.06.2022.
//  
//

import Foundation

// MARK: Protocol - PromotionPresenterToRouterProtocol (Presenter -> Router)
protocol PromotionPresenterToRouterProtocol: AnyObject {

}

class PromotionRouter {

    // MARK: Properties
    weak var view: PromotionRouterToViewProtocol!
}

// MARK: Extension - PromotionPresenterToRouterProtocol
extension PromotionRouter: PromotionPresenterToRouterProtocol {
    
}