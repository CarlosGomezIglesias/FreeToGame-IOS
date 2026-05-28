//
//  ViewController.swift
//  FreeToGame-IOS
//
//  Created by Tardes on 28/5/26.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Task {
            let result = await GameService.getGamesList()
            print(result)
        }
    }


}

