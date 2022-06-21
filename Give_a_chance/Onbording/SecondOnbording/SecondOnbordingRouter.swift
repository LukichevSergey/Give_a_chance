//
//  SecondOnbordingRouter.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 21.06.2022.
//  
//

import Foundation

// MARK: Protocol - SecondOnbordingPresenterToRouterProtocol (Presenter -> Router)
protocol SecondOnbordingPresenterToRouterProtocol: AnyObject {
    func navigationToThirdOnbording()
}

class SecondOnbordingRouter {

    // MARK: Properties
    weak var view: SecondOnbordingRouterToViewProtocol!
}

// MARK: Extension - SecondOnbordingPresenterToRouterProtocol
extension SecondOnbordingRouter: SecondOnbordingPresenterToRouterProtocol {
    func navigationToThirdOnbording() {
        let thirdOnbodribgViewConfiguration = ThirdOnbordingConfigurator()
        view.pushView(view: thirdOnbodribgViewConfiguration.configure())
    }
}
