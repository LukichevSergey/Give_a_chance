//
//  FirstOnbordingRouter.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 21.06.2022.
//  
//

import Foundation

// MARK: Protocol - FirstOnbordingPresenterToRouterProtocol (Presenter -> Router)
protocol FirstOnbordingPresenterToRouterProtocol: AnyObject {
    func navigationToSecondOnbording()
    func navigationToRootViewController()
}

class FirstOnbordingRouter {

    // MARK: Properties
    weak var view: FirstOnbordingRouterToViewProtocol!
}

// MARK: Extension - FirstOnbordingPresenterToRouterProtocol
extension FirstOnbordingRouter: FirstOnbordingPresenterToRouterProtocol {
    func navigationToSecondOnbording() {
        let secondOnbodribgViewConfiguration = SecondOnbordingConfigurator()
        view.pushView(view: secondOnbodribgViewConfiguration.configure())
    }
    
    func navigationToRootViewController() {
        let mainApplication = RootMainApplicitionController()
        mainApplication.modalPresentationStyle = .fullScreen
        view.presentView(view: mainApplication)
    }
}
