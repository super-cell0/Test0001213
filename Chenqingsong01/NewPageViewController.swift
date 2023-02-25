//
//  NewPageViewController.swift
//  Chenqingsong01
//
//  Created by mac on 2023/2/8.
//

import UIKit

class NewPageViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationItem.title = "beidixiaoxiong"
        
        //navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: nil, action: #selector(back))

    }

    @objc func back() {
        navigationController?.popViewController(animated: true)
    }
    


}
