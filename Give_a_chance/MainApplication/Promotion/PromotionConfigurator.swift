//
//  PromotionConfigurator.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 22.06.2022.
//  
//

import UIKit

class PromotionConfigurator {
    func configure() -> UIViewController {
        let view = PromotionViewController()
        let presenter = PromotionPresenter()
        let router = PromotionRouter()
        let interactor = PromotionInteractor()
        
        view.presenter = presenter

        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view

        interactor.presenter = presenter
        
        router.view = view
        
        return view
    }
}