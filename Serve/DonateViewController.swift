//
//  DonateViewController.swift
//  Serve
//
//  Created by Bamlak Gessessew on 8/8/17.
//  Copyright © 2017 Bamlak Gessessew. All rights reserved.
//

import UIKit

class DonateViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissScreen(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    
    @IBAction func didPressView(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    
    @IBAction func openApplePay(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Individual", bundle: nil)
        let popOverVC = storyboard.instantiateViewController(withIdentifier: "popUpStoryboard2") as! ApplePayViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
