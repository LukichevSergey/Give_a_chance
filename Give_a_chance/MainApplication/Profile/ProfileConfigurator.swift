//
//  ProfileConfigurator.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 22.06.2022.
//  
//

import UIKit

class ProfileConfigurator {
    func configure() -> UIViewController {
        let view = ProfileViewController()
        let presenter = ProfilePresenter()
        let router = ProfileRouter()
        let interactor = ProfileInteractor()
        
        view.presenter = presenter

        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view

        interactor.presenter = presenter
        
        router.view = view
        
        return view
    }
}