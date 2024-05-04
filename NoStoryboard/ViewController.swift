//
//  ViewController.swift
//  NoStoryboard
//
//  Created by Issei Ueda on 2024/05/04.
//

import UIKit

class ViewController: UIViewController {
    
    //以下はストアドプロパティ
    ///ストアドプロパティには、値の変更を監視するプロパティオブザーバーという機能が備わっている。
    let titleLabel: UILabel = {
        let view = UILabel.init()
        view.text = "Hello, World!"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var button: UIButton = {
        let view = UIButton.init()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.blue
        view.setTitle("モーダル遷移", for: .normal)
        view.addTarget(self, action: #selector(openModal(_:)), for: .touchDown)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        view.addSubview(titleLabel)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            button.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func openModal(_ sender: UIButton) {
        let modalViewController = ModalViewController.init()
        //presentを呼ぶときは
        //遷移するときは一つ目の引数に遷移させたいViewControllerを渡す
        //二つ目にアニメーションさせるかどうか
        //三つ目は遷移が終わった時のクロージャーを渡す
        present(modalViewController, animated: true, completion: nil)
    }


}

