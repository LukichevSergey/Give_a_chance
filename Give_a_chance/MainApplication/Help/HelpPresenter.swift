//
//  HelpPresenter.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 22.06.2022.
//  
//

import Foundation

// MARK: Protocol - HelpViewToPresenterProtocol (View -> Presenter)
protocol HelpViewToPresenterProtocol: AnyObject {
	func viewDidLoad()
    func segmentedControlTapped(withStatus status: CustomSegmentedControlElement.Status)
}

// MARK: Protocol - HelpInteractorToPresenterProtocol (Interactor -> Presenter)
protocol HelpInteractorToPresenterProtocol: AnyObject {

}

class HelpPresenter {

    // MARK: Properties
    var router: HelpPresenterToRouterProtocol!
    var interactor: HelpPresenterToInteractorProtocol!
    weak var view: HelpPresenterToViewProtocol!
}

// MARK: Extension - HelpViewToPresenterProtocol
extension HelpPresenter: HelpViewToPresenterProtocol {
    func viewDidLoad() {
        view.updateCollection(with: interactor.openDataSource)
    }
    
    func segmentedControlTapped(withStatus status: CustomSegmentedControlElement.Status) {
        switch status {
        case .open:
            view.updateCollection(with: interactor.openDataSource)
        case .closed:
            view.updateCollection(with: interactor.closedDataSource)
        }
    }
}

// MARK: Extension - HelpInteractorToPresenterProtocol
extension HelpPresenter: HelpInteractorToPresenterProtocol {
    
}
