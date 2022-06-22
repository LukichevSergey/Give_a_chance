//
//  SecondOnbordingPresenter.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 21.06.2022.
//  
//

import Foundation

// MARK: Protocol - SecondOnbordingViewToPresenterProtocol (View -> Presenter)
protocol SecondOnbordingViewToPresenterProtocol: AnyObject {
    func viewDidLoad()
    func nextButtonTapped()
    func skipButtonTapped()
}

// MARK: Protocol - SecondOnbordingInteractorToPresenterProtocol (Interactor -> Presenter)
protocol SecondOnbordingInteractorToPresenterProtocol: AnyObject {

}

class SecondOnbordingPresenter {

    // MARK: Properties
    var router: SecondOnbordingPresenterToRouterProtocol!
    var interactor: SecondOnbordingPresenterToInteractorProtocol!
    weak var view: SecondOnbordingPresenterToViewProtocol!
}

// MARK: Extension - SecondOnbordingViewToPresenterProtocol
extension SecondOnbordingPresenter: SecondOnbordingViewToPresenterProtocol {
    func viewDidLoad() {
    
    }
    
    func nextButtonTapped() {
        router.navigationToThirdOnbording()
    }
    
    func skipButtonTapped() {
        router.navigationToRetrievedViewController()
    }
}

// MARK: Extension - SecondOnbordingInteractorToPresenterProtocol
extension SecondOnbordingPresenter: SecondOnbordingInteractorToPresenterProtocol {
    
}
