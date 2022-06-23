//
//  PromotionInteractor.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 22.06.2022.
//  
//

import Foundation

// MARK: Protocol - PromotionPresenterToInteractorProtocol (Presenter -> Interactor)
protocol PromotionPresenterToInteractorProtocol: AnyObject {

}

class PromotionInteractor {

    // MARK: Properties
    weak var presenter: PromotionInteractorToPresenterProtocol!

}

// MARK: Extension - PromotionPresenterToInteractorProtocol
extension PromotionInteractor: PromotionPresenterToInteractorProtocol {
    
}