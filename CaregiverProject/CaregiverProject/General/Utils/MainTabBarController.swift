//
//  MainTabBarController.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 20/04/21.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLayoutSubviews() {
        setBorder()
        setTabBarSize()
        addSeparators()
    }
    
    private func setTabBarSize() {
        var newTabBarFrame = tabBar.frame
        
        let newTabBarHeight: CGFloat = 100
        newTabBarFrame.size.height = newTabBarHeight
        newTabBarFrame.origin.y = self.view.frame.size.height - newTabBarHeight
        
        tabBar.frame = newTabBarFrame
    }
    
    private func setBorder() {
        tabBar.isTranslucent = false
        tabBar.backgroundColor = .white
        tabBar.layer.borderWidth = 2
        tabBar.layer.borderColor = #colorLiteral(red: 0.7881655693, green: 0.7882800698, blue: 0.7881404757, alpha: 1)
        tabBar.clipsToBounds = true
    }
    
    private func addSeparators() {
        guard let items = tabBar.items, !items.isEmpty else { return }
        let height = tabBar.bounds.height
        let numItems = CGFloat(items.count)
        let itemSize = CGSize(
            width: tabBar.frame.width/numItems,
            height: tabBar.frame.height
        )
        for index in 1..<items.count {
            let xPosition = itemSize.width * CGFloat(index)
            let size = CGSize(width: 2, height: height * 0.5)
            let pos = CGPoint(x: xPosition, y: size.height/4)
            let separator = UIView(frame: CGRect(origin: pos, size: size))
            separator.backgroundColor = #colorLiteral(red: 0.7881655693, green: 0.7882800698, blue: 0.7881404757, alpha: 1)
            tabBar.insertSubview(separator, at: 1)
        }
    }
}

