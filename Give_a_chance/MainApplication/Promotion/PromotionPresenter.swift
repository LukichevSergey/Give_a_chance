//
//  PromotionPresenter.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 22.06.2022.
//  
//

import Foundation

// MARK: Protocol - PromotionViewToPresenterProtocol (View -> Presenter)
protocol PromotionViewToPresenterProtocol: AnyObject {
	func viewDidLoad()
}

// MARK: Protocol - PromotionInteractorToPresenterProtocol (Interactor -> Presenter)
protocol PromotionInteractorToPresenterProtocol: AnyObject {

}

class PromotionPresenter {

    // MARK: Properties
    var router: PromotionPresenterToRouterProtocol!
    var interactor: PromotionPresenterToInteractorProtocol!
    weak var view: PromotionPresenterToViewProtocol!
}

// MARK: Extension - PromotionViewToPresenterProtocol
extension PromotionPresenter: PromotionViewToPresenterProtocol {
    func viewDidLoad() {
    
    }
}

// MARK: Extension - PromotionInteractorToPresenterProtocol
extension PromotionPresenter: PromotionInteractorToPresenterProtocol {
    
}