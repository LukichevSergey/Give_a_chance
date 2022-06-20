//
//  FirstOnbordingConfigurator.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 21.06.2022.
//  
//

import UIKit

class FirstOnbordingConfigurator {
    func configure() -> UIViewController {
        let view = FirstOnbordingViewController()
        let presenter = FirstOnbordingPresenter()
        let router = FirstOnbordingRouter()
        let interactor = FirstOnbordingInteractor()
        
        view.presenter = presenter

        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view

        interactor.presenter = presenter
        
        router.view = view
        
        return view
    }
}