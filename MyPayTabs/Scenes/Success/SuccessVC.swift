//
//  SuccessVC.swift
//  MyPayTabs
//
//  Created by Soufian Hossam on 6/18/20.
//  Copyright © 2020 Soufian Hossam. All rights reserved.
//

import UIKit

class SuccessVC: UIViewController {
    var closeButton: UIButton = {
        let b = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        b.setTitle("[x] Close", for: .normal)
        b.setTitleColor(.red, for: .normal)
        b.addTarget(self, action: #selector(dismissButtonHandler), for: .touchUpInside)
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    var successLabel: UILabel = {
        let l = UILabel()
        l.textColor = .green
        l.font = UIFont.boldSystemFont(ofSize: 30)
        l.text = "Approved"
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(closeButton)
        view.addSubview(successLabel)
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            successLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            successLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func dismissButtonHandler() {
        dismiss(animated: true)
    }
}
