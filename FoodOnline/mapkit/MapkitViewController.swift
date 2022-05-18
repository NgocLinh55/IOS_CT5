//
//  MapkitViewController.swift
//  FoodOnline
//
//  Created by OS on 6/24/21.
//  Copyright © 2021 TruongKD. All rights reserved.
//

import UIKit
import MapKit
class MapkitViewController: UIViewController {
    @IBAction func btnBack(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "newFood") as! UINavigationController
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .flipHorizontal
        present(controller, animated: true, completion: nil)
    }
    //    @IBAction func btnBack(_ sender: Any) {
//        let controller = storyboard?.instantiateViewController(withIdentifier: "newFood") as! UINavigationController
//        controller.modalPresentationStyle = .fullScreen
//        controller.modalTransitionStyle = .flipHorizontal
//        present(controller, animated: true, completion: nil)
//    }
    
    @IBOutlet weak var mapKitView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //10.8514325,106.7580641
        let viTri = MKPointAnnotation()
        viTri.coordinate = CLLocationCoordinate2D(latitude: 10.8514325, longitude: 106.7580641)
        viTri.title = "green Food"
        viTri.subtitle = "Vo Van Ngan"
        mapKitView.addAnnotation(viTri)
        let khuVuc = MKCoordinateRegion(center: viTri.coordinate,latitudinalMeters: 500,longitudinalMeters: 500)
        mapKitView.setRegion(khuVuc, animated: true)
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
