//
//  FoundationConfigurator.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 22.06.2022.
//  
//

import UIKit

class FoundationConfigurator {
    func configure() -> UIViewController {
        let view = FoundationViewController()
        let presenter = FoundationPresenter()
        let router = FoundationRouter()
        let interactor = FoundationInteractor()
        
        view.presenter = presenter

        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view

        interactor.presenter = presenter
        
        router.view = view
        
        return view
    }
}