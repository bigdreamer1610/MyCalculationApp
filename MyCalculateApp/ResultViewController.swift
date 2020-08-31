//
//  ResultViewController.swift
//  MyCalculateApp
//
//  Created by THUY Nguyen Duong Thu on 8/20/20.
//  Copyright © 2020 THUY Nguyen Duong Thu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var btnPlayAgain: UIButton!
    @IBOutlet var lbResult: UILabel!
    var name: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        lbResult.text = name
        // Do any additional setup after loading the view.
    }

    
    @IBAction func clickPlayAgain(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "MainController") as? MainController
        self.navigationController?.pushViewController(vc!, animated: true)
        //present(vc!, animated: true)
    }
    
}
