//
//  ProfileRouter.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 22.06.2022.
//  
//

import Foundation

// MARK: Protocol - ProfilePresenterToRouterProtocol (Presenter -> Router)
protocol ProfilePresenterToRouterProtocol: AnyObject {

}

class ProfileRouter {

    // MARK: Properties
    weak var view: ProfileRouterToViewProtocol!
}

// MARK: Extension - ProfilePresenterToRouterProtocol
extension ProfileRouter: ProfilePresenterToRouterProtocol {
    
}