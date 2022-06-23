//
//  HelpConfigurator.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 22.06.2022.
//  
//

import UIKit

class HelpConfigurator {
    func configure() -> UIViewController {
        let view = HelpViewController()
        let presenter = HelpPresenter()
        let router = HelpRouter()
        let interactor = HelpInteractor()
        
        view.presenter = presenter

        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view

        interactor.presenter = presenter
        
        router.view = view
        
        return view
    }
}