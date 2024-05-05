//
//  FisrtPageViewController.swift
//  NoStoryboard
//
//  Created by Issei Ueda on 2024/05/05.
//

import UIKit

class FisrtPageViewController: UIViewController {
    
    lazy var button: UIButton = {
        let view = UIButton.init()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.blue
        view.setTitle("次のページへ", for: .normal)
        view.addTarget(self, action: #selector(nextPage(_:)), for: .touchDown)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemPink
        
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            //button.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
            //と意味は同じ
            //constantが指定されいない場合はデフォルトで0になる
            //constantを指定することであとで値を指定できる
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func nextPage(_ sender: UIButton) {
        let secondPageViewController = SecondPageViewController.init()
        navigationController?.pushViewController(secondPageViewController, animated: true)
    }

}
