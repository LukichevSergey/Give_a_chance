//
//  ThirdOnbordingRouter.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 21.06.2022.
//  
//

import Foundation

// MARK: Protocol - ThirdOnbordingPresenterToRouterProtocol (Presenter -> Router)
protocol ThirdOnbordingPresenterToRouterProtocol: AnyObject {

}

class ThirdOnbordingRouter {

    // MARK: Properties
    weak var view: ThirdOnbordingRouterToViewProtocol!
}

// MARK: Extension - ThirdOnbordingPresenterToRouterProtocol
extension ThirdOnbordingRouter: ThirdOnbordingPresenterToRouterProtocol {
    
}