//
//  RetrievedConfigurator.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 21.06.2022.
//  
//

import UIKit

class RetrievedConfigurator {
    func configure() -> UIViewController {
        let view = RetrievedViewController()
        let presenter = RetrievedPresenter()
        let router = RetrievedRouter()
        let interactor = RetrievedInteractor()
        
        view.presenter = presenter

        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view

        interactor.presenter = presenter
        
        router.view = view
        
        return view
    }
}