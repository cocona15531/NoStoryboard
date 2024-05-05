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
    
    lazy var navButton: UIButton = {
        let view = UIButton.init()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.blue
        view.setTitle("ナビゲーション", for: .normal)
        view.addTarget(self, action: #selector(openNavigation(_:)), for: .touchDown)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        view.addSubview(titleLabel)
        view.addSubview(button)
        view.addSubview(navButton)
        
        NSLayoutConstraint.activate([
            //titleLabelは元々あるviewを元に中心に配置される
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            //buttonはtitleLabelのbuttomからbuttonのtopを計算して10pxに空間を開けて配置される
            button.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            //buttonのY軸はすでに決まっているからあとはX軸だけを決める
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //同じくnavButtonもbuttonと同様に配置される
            navButton.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 10),
            navButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
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
    
    @objc func openNavigation(_ sender: UIButton) {
        let fisrtPageViewController = FisrtPageViewController.init()
        //rootViewControllerに指定したいviewcontrollerを渡す
        let navigationController = UINavigationController.init(rootViewController: fisrtPageViewController)
        present(navigationController, animated: true, completion: nil)
    }


}

