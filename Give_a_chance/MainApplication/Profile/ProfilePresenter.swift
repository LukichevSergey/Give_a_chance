//
//  ProfilePresenter.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 22.06.2022.
//  
//

import Foundation

// MARK: Protocol - ProfileViewToPresenterProtocol (View -> Presenter)
protocol ProfileViewToPresenterProtocol: AnyObject {
	func viewDidLoad()
}

// MARK: Protocol - ProfileInteractorToPresenterProtocol (Interactor -> Presenter)
protocol ProfileInteractorToPresenterProtocol: AnyObject {

}

class ProfilePresenter {

    // MARK: Properties
    var router: ProfilePresenterToRouterProtocol!
    var interactor: ProfilePresenterToInteractorProtocol!
    weak var view: ProfilePresenterToViewProtocol!
}

// MARK: Extension - ProfileViewToPresenterProtocol
extension ProfilePresenter: ProfileViewToPresenterProtocol {
    func viewDidLoad() {
    
    }
}

// MARK: Extension - ProfileInteractorToPresenterProtocol
extension ProfilePresenter: ProfileInteractorToPresenterProtocol {
    
}