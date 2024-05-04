//
//  ViewController.swift
//  NoStoryboard
//
//  Created by Issei Ueda on 2024/05/04.
//

import UIKit

class ViewController: UIViewController {
    
    let titleLabel: UILabel = {
        let view = UILabel.init()
        view.text = "Hello, World!"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0)
        ])
    }


}

