//
//  StartOnbording.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 21.06.2022.
//

import UIKit

class StartOnbording {
    func start() -> UIViewController {
        
        let firstOnbordingConfigurator = FirstOnbordingConfigurator()
        let navigationController = UINavigationController(rootViewController: firstOnbordingConfigurator.configure())
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.navigationBar.isHidden = true
        
        return navigationController
    }
}
