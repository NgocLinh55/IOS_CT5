//
//  welcomeViewController.swift
//  FoodManagement
//
//  Created by OS on 6/24/21.
//  Copyright © 2021 TruongKD. All rights reserved.
//

import UIKit

class welcomeViewController: UIViewController {
    // MARK: chuyen man hinh sang homNC
    @IBAction func btnBatDau(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "homeNC") as! UINavigationController
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .flipHorizontal
        present(controller, animated: true, completion: nil)
        //print("bat dau")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
