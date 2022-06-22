//
//  CustomTabBarController.swift
//  Give_a_chance
//
//  Created by Сергей Лукичев on 21.06.2022.
//

import UIKit
import Combine

class CustomTabBarController: UITabBarController {
    private var subscriptions = Set<AnyCancellable>()
    
    var tabbars: [UIViewController] = [] {
        didSet { self.viewControllers = tabbars }
    }

    var lastSelectIndex: Int = 0
    private var statusAPI: Bool = true
    private var imageURL: String?
    
    override var selectedIndex: Int {
        didSet {
            lastSelectIndex = selectedIndex
            tabBar.actionForItemView(index: selectedIndex)
        }
    }
    
    private let indexTabWithProfileUser = 4
    
    override open func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
        
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        tabBar.standardAppearance = appearance

        if #available(iOS 15, *) {
            tabBar.scrollEdgeAppearance = appearance
        }
    }

    func addTabView(views: [TypeElementTabBar]) {
        for index in 0..<tabbars.count {
            guard index < views.count else { return }
            tabBar.addIconInTabBar(index: index, typeAvatar: views[index])
        }
    }
    
    func setFirstBarItem(index: Int = 0) {
        tabBar.setImageWithOutAnimation(index: index)
    }
    
    func updateIconTabBarItem(withPathImage pathImage: String?) {

    }
    
    func updateProfileIcon(onImage image: UIImage) {
        updateIcon(index: indexTabWithProfileUser, item: .image(object: image))
    }
    
    private func updateIcon(index: Int, item: TypeElementTabBar) {
        if tabBar.checkTabBarItem(index: index) {
            tabBar.removeTabBarItem(index: index)
            tabBar.addIconInTabBar(index: index, typeAvatar: item)
            if lastSelectIndex == index {
                tabBar.actionForItemView(index: index)
            }
        }
    }
}

extension CustomTabBarController: UITabBarControllerDelegate {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if let index = tabBar.items?.firstIndex(of: item),
           index != lastSelectIndex {
            lastSelectIndex = index
            tabBar.actionForItemView(index: index)
        }
    }
}
