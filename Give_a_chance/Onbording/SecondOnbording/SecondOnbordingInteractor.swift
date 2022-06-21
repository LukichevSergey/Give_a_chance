//
//  SecondOnbordingInteractor.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 21.06.2022.
//  
//

import Foundation

// MARK: Protocol - SecondOnbordingPresenterToInteractorProtocol (Presenter -> Interactor)
protocol SecondOnbordingPresenterToInteractorProtocol: AnyObject {

}

class SecondOnbordingInteractor {

    // MARK: Properties
    weak var presenter: SecondOnbordingInteractorToPresenterProtocol!

}

// MARK: Extension - SecondOnbordingPresenterToInteractorProtocol
extension SecondOnbordingInteractor: SecondOnbordingPresenterToInteractorProtocol {
    
}