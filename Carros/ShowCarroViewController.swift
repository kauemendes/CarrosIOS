
//
//  ShowCarroViewController.swift
//  Carros
//
//  Created by Kaue Mendes on 3/19/15.
//  Copyright (c) 2015 Fellas Group. All rights reserved.
//

import UIKit

class ShowCarroViewController: UIViewController {

    var carroA : String = ""
    @IBOutlet weak var txtCarro: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtCarro.text = carroA
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
