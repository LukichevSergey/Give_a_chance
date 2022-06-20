//
//  FirstOnbordingViewController.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 21.06.2022.
//  
//

import UIKit

// MARK: Protocol - FirstOnbordingPresenterToViewProtocol (Presenter -> View)
protocol FirstOnbordingPresenterToViewProtocol: AnyObject {

}

// MARK: Protocol - FirstOnbordingRouterToViewProtocol (Router -> View)
protocol FirstOnbordingRouterToViewProtocol: AnyObject {
    func presentView(view: UIViewController)
    func pushView(view: UIViewController)
}

class FirstOnbordingViewController: UIViewController {
    
    // MARK: - Property
    var presenter: FirstOnbordingViewToPresenterProtocol!

    // MARK: - init
    init() {
        super.init(nibName: nil, bundle: nil)

        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        presenter.viewDidLoad()
    }
    
    // MARK: - private func
    private func commonInit() {

    }

    private func configureUI() {

    }
}

// MARK: Extension - FirstOnbordingPresenterToViewProtocol 
extension FirstOnbordingViewController: FirstOnbordingPresenterToViewProtocol{
    
}

// MARK: Extension - FirstOnbordingRouterToViewProtocol
extension FirstOnbordingViewController: FirstOnbordingRouterToViewProtocol{
    func presentView(view: UIViewController) {
        present(view, animated: true, completion: nil)
    }

    func pushView(view: UIViewController) {
        navigationController?.pushViewController(view, animated: true)
    }
}