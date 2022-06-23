//
//  ProfileInteractor.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 22.06.2022.
//  
//

import Foundation

// MARK: Protocol - ProfilePresenterToInteractorProtocol (Presenter -> Interactor)
protocol ProfilePresenterToInteractorProtocol: AnyObject {

}

class ProfileInteractor {

    // MARK: Properties
    weak var presenter: ProfileInteractorToPresenterProtocol!

}

// MARK: Extension - ProfilePresenterToInteractorProtocol
extension ProfileInteractor: ProfilePresenterToInteractorProtocol {
    
}