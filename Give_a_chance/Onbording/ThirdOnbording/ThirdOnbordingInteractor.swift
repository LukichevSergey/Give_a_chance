//
//  ThirdOnbordingInteractor.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 21.06.2022.
//  
//

import Foundation

// MARK: Protocol - ThirdOnbordingPresenterToInteractorProtocol (Presenter -> Interactor)
protocol ThirdOnbordingPresenterToInteractorProtocol: AnyObject {

}

class ThirdOnbordingInteractor {

    // MARK: Properties
    weak var presenter: ThirdOnbordingInteractorToPresenterProtocol!

}

// MARK: Extension - ThirdOnbordingPresenterToInteractorProtocol
extension ThirdOnbordingInteractor: ThirdOnbordingPresenterToInteractorProtocol {
    
}