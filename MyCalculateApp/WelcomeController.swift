//
//  WelcomeController.swift
//  MyCalculateApp
//
//  Created by THUY Nguyen Duong Thu on 8/19/20.
//  Copyright © 2020 THUY Nguyen Duong Thu. All rights reserved.
//

import UIKit

class WelcomeController: UIViewController {

    let backgroundImageView = UIImageView()
    
    @IBOutlet var btnplay: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "alo"
        designButton()
    }
    
    func designButton(){
        btnplay.layer.cornerRadius = 30
        btnplay.layer.masksToBounds = true
    }
    
    
    @IBAction func clickPlay(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainController") as? MainController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
