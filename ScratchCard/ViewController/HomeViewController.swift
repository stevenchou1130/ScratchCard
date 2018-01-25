//
//  HomeViewController.swift
//  ScratchCard
//
//  Created by steven chou on 2018/01/04.
//  Copyright © 2017年 Steven Chou. All rights reserved.
//

import UIKit

enum ImageName: String {
    case img1 = "img-1"
    case img2 = "img-2"
    case img3 = "img-3"
    case imgSteven = "img-steven"
    case imgBG = "bg-home"
    case iconEraser = "icon-eraser"
}

class HomeViewController: UIViewController {
    
    var scratchCardView:SKScratchCardView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Scratch Card"
        setupView()
    }
    
    private func setupView() {
        let imageView = UIImageView(image: UIImage(named: ImageName.imgSteven.rawValue))
        imageView.contentMode = .scaleAspectFill
        
        let coverView = UIImageView(image: UIImage(named: ImageName.imgBG.rawValue))
        coverView.contentMode = .scaleAspectFill
        
        let screen = UIScreen.main.bounds
        scratchCardView = SKScratchCardView(frame: screen)
        scratchCardView!.setupWith(coverView: coverView, contentView: imageView)
        view.addSubview(scratchCardView!)

        // set navigation bar right button
        let button = UIButton(type: .custom)
        button.addTarget(self, action: #selector(clearButtonClickHandler), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
        button.setImage(UIImage(named: ImageName.iconEraser.rawValue), for: .normal)
        button.widthAnchor.constraint(equalToConstant: 32.0).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32.0).isActive = true

        let barButtonItem = UIBarButtonItem()
        barButtonItem.customView = button
        barButtonItem.target = self
        barButtonItem.action = #selector(clearButtonClickHandler)

        navigationItem.setRightBarButton(barButtonItem, animated: false)
    }
    
    @objc private func clearButtonClickHandler(){
        print("clear")
        scratchCardView?.clearCanvas()
    }
}
