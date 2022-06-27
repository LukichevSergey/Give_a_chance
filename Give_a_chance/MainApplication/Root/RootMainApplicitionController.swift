//
//  RootMainApplicitionController.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 21.06.2022.
//

import UIKit

class RootMainApplicitionController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        modalPresentationStyle = .fullScreen
        modalTransitionStyle = .coverVertical

        let retrievedViewController = RetrievedConfigurator().configure()
        let promotionViewController = PromotionConfigurator().configure()
        let helpViewController = HelpConfigurator().configure()
        let foundationViewController = FoundationConfigurator().configure()
        let profileViewController = ProfileConfigurator().configure()

        retrievedViewController.title = "Поступление"
        promotionViewController.title = "Акция"
        helpViewController.title = "Кому помочь"
        foundationViewController.title = "О фонде"
        profileViewController.title = "Профиль"

        setViewControllers([retrievedViewController,
                            promotionViewController,
                            helpViewController,
                            foundationViewController,
                            profileViewController ], animated: false)

        guard let items = self.tabBar.items else { return }

        let imageRetrieved = UIImage(systemName: "dollarsign.circle")!
        let imagePromotion = UIImage(systemName: "clock.arrow.circlepath")!
        let imageHelp = UIImage(systemName: "hand.raised.fill")!
        let imageFoundation = UIImage(systemName: "exclamationmark.circle")!
        let imageProfile = UIImage(systemName: "person.crop.circle")!
        let views = [imageRetrieved, imagePromotion, imageHelp, imageFoundation, imageProfile]

        for item in 0..<items.count {
            if item == 2 {continue}
            items[item].image = views[item]
        }
        
        tabBar.isHidden = true

        let customTabBar = CustomTabBar()
        customTabBar.items = items
        customTabBar.tintColor = UIColor(hex: "#F4647D")

        view.addSubview(customTabBar)
        customTabBar.snp.makeConstraints { make in
            make.bottom.right.left.equalToSuperview()
            make.height.equalTo(90)
        }
        
        setupMiddleButton(tabbar: customTabBar)
    }
    
    private func setupMiddleButton(tabbar: CustomTabBar) {
        let middleButton = UIButton()
        middleButton.setBackgroundImage(UIImage(named: "centerButtonTabbar"), for: .normal)
        
        tabbar.addSubview(middleButton)
        middleButton.snp.makeConstraints { make in
            make.width.height.equalTo(62)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(-20)
        }
        view.layoutIfNeeded()
    }
}
