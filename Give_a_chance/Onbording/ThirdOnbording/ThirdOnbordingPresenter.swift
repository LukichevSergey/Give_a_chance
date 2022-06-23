//
//  ThirdOnbordingPresenter.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 21.06.2022.
//  
//

import Foundation

// MARK: Protocol - ThirdOnbordingViewToPresenterProtocol (View -> Presenter)
protocol ThirdOnbordingViewToPresenterProtocol: AnyObject {
	func viewDidLoad()
    func nextButtonTapped()
    func skipButtonTapped()
}

// MARK: Protocol - ThirdOnbordingInteractorToPresenterProtocol (Interactor -> Presenter)
protocol ThirdOnbordingInteractorToPresenterProtocol: AnyObject {

}

class ThirdOnbordingPresenter {

    // MARK: Properties
    var router: ThirdOnbordingPresenterToRouterProtocol!
    var interactor: ThirdOnbordingPresenterToInteractorProtocol!
    weak var view: ThirdOnbordingPresenterToViewProtocol!
}

// MARK: Extension - ThirdOnbordingViewToPresenterProtocol
extension ThirdOnbordingPresenter: ThirdOnbordingViewToPresenterProtocol {
    func viewDidLoad() {
    
    }
    
    func nextButtonTapped() {
        router.navigationToRootViewController()
    }
    
    func skipButtonTapped() {
        router.navigationToRootViewController()
    }
}

// MARK: Extension - ThirdOnbordingInteractorToPresenterProtocol
extension ThirdOnbordingPresenter: ThirdOnbordingInteractorToPresenterProtocol {
    
}
