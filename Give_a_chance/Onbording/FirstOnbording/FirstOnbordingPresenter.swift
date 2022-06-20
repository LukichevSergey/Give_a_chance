//
//  FirstOnbordingPresenter.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 21.06.2022.
//  
//

import Foundation

// MARK: Protocol - FirstOnbordingViewToPresenterProtocol (View -> Presenter)
protocol FirstOnbordingViewToPresenterProtocol: AnyObject {
	func viewDidLoad()
}

// MARK: Protocol - FirstOnbordingInteractorToPresenterProtocol (Interactor -> Presenter)
protocol FirstOnbordingInteractorToPresenterProtocol: AnyObject {

}

class FirstOnbordingPresenter {

    // MARK: Properties
    var router: FirstOnbordingPresenterToRouterProtocol!
    var interactor: FirstOnbordingPresenterToInteractorProtocol!
    weak var view: FirstOnbordingPresenterToViewProtocol!
}

// MARK: Extension - FirstOnbordingViewToPresenterProtocol
extension FirstOnbordingPresenter: FirstOnbordingViewToPresenterProtocol {
    func viewDidLoad() {
    
    }
}

// MARK: Extension - FirstOnbordingInteractorToPresenterProtocol
extension FirstOnbordingPresenter: FirstOnbordingInteractorToPresenterProtocol {
    
}