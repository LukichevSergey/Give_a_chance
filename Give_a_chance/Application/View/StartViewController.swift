//
//  StartViewController.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 21.06.2022.
//

import UIKit

class StartViewController: UIViewController {
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = PaletteApp.white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        choisePerformSegue()
    }
    
    private func choisePerformSegue() {
        let startOnbording = StartOnbording()
        present(startOnbording.start(), animated: false)
    }
}
