//
//  HelpViewController.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 22.06.2022.
//  
//

import UIKit

// MARK: Protocol - HelpPresenterToViewProtocol (Presenter -> View)
protocol HelpPresenterToViewProtocol: AnyObject {

}

// MARK: Protocol - HelpRouterToViewProtocol (Router -> View)
protocol HelpRouterToViewProtocol: AnyObject {
    func presentView(view: UIViewController)
    func pushView(view: UIViewController)
}

class HelpViewController: UIViewController {
    
    // MARK: - Property
    var presenter: HelpViewToPresenterProtocol!

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
        view.backgroundColor = .green
    }
}

// MARK: Extension - HelpPresenterToViewProtocol 
extension HelpViewController: HelpPresenterToViewProtocol{
    
}

// MARK: Extension - HelpRouterToViewProtocol
extension HelpViewController: HelpRouterToViewProtocol{
    func presentView(view: UIViewController) {
        present(view, animated: true, completion: nil)
    }

    func pushView(view: UIViewController) {
        navigationController?.pushViewController(view, animated: true)
    }
}
