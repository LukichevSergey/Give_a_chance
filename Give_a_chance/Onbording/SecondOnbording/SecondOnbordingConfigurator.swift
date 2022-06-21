//
//  SecondOnbordingConfigurator.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 21.06.2022.
//  
//

import UIKit

class SecondOnbordingConfigurator {
    func configure() -> UIViewController {
        let view = SecondOnbordingViewController()
        let presenter = SecondOnbordingPresenter()
        let router = SecondOnbordingRouter()
        let interactor = SecondOnbordingInteractor()
        
        view.presenter = presenter

        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view

        interactor.presenter = presenter
        
        router.view = view
        
        return view
    }
}