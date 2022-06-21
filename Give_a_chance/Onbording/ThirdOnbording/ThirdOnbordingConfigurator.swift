//
//  ThirdOnbordingConfigurator.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 21.06.2022.
//  
//

import UIKit

class ThirdOnbordingConfigurator {
    func configure() -> UIViewController {
        let view = ThirdOnbordingViewController()
        let presenter = ThirdOnbordingPresenter()
        let router = ThirdOnbordingRouter()
        let interactor = ThirdOnbordingInteractor()
        
        view.presenter = presenter

        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view

        interactor.presenter = presenter
        
        router.view = view
        
        return view
    }
}