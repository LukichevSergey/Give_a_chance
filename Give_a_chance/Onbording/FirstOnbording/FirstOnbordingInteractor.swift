//
//  FirstOnbordingInteractor.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 21.06.2022.
//  
//

import Foundation

// MARK: Protocol - FirstOnbordingPresenterToInteractorProtocol (Presenter -> Interactor)
protocol FirstOnbordingPresenterToInteractorProtocol: AnyObject {

}

class FirstOnbordingInteractor {

    // MARK: Properties
    weak var presenter: FirstOnbordingInteractorToPresenterProtocol!

}

// MARK: Extension - FirstOnbordingPresenterToInteractorProtocol
extension FirstOnbordingInteractor: FirstOnbordingPresenterToInteractorProtocol {
    
}