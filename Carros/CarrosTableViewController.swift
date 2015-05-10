//
//  CarrosTableViewController.swift
//  Carros
//
//  Created by Kaue Mendes on 3/19/15.
//  Copyright (c) 2015 Fellas Group. All rights reserved.
//

import UIKit

class CarrosTableViewController: UITableViewController {

    //Array das montadoras
    var carrosArray : [[String:AnyObject]] = [
        //Dicionario com carros da Honda
        ["Montadora" : "Honda",
            "Carros":["Civic", "City", "Fit"] ],
        ["Montadora" : "Volkswagen",
            "Carros": ["Gol", "Fox", "Fusca", "Brasilia", "UP"] ],
        ["Montadora" : "Hyundai",
            "Carros": ["i30", "HB20", "Tucson"] ],
        ["Montadora" : "Mercedes Benz",
            "Carros": ["C130", "Classe A", "SLS AMG"] ],
        ["Montadora" : "Jac Motors",
            "Carros": ["J1", "J2", "J3"] ]
        
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: "doRefresh", forControlEvents: .ValueChanged)
        refreshControl?.tintColor = UIColor.redColor()
        
        
         self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func doRefresh(){
        NSTimer(timeInterval: 2.0, target: refreshControl!, selector: "endRefreshing", userInfo: nil, repeats: false)
//        refreshControl?.endRefreshing()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return carrosArray.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        let montadoraDict = carrosArray[section]
        
        if let carrosPorMontadora = montadoraDict["Carros"] as? [String]{
            return carrosPorMontadora.count
        }
        
        return 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as CarroTableViewCell
        
        
        let montadoraDict = carrosArray[indexPath.section]
        
        if let carros = montadoraDict["Carros"] as? [String]{
            cell.backgroundColor = UIColor(red: 230, green: 240, blue: 255, alpha: 1)
            cell.imageView?.image = UIImage(named: "carro")
            // cell.detailTextLabel?.text = "Carro Usado"
            cell.accessoryType = UITableViewCellAccessoryType.DetailButton
            cell.txtMasterLabel.text = carros[indexPath.row]
            cell.txtSlaveLabel.text = "Carro Usado"
        }
        
        
        // Configure the cell...
        return cell
    }
    
    override func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        
        let montadoraDict = carrosArray[indexPath.section]
        
        var carToShow = ""
        
        if let carros = montadoraDict["Carros"] as? [String]{
            carToShow = carros[indexPath.row]
        }
        
        
        var alertSaved = UIAlertController(
            title: "Carro Selecionado"
            , message: "Parabéns! Carro \(carToShow) foi selecionado com sucesso."
            , preferredStyle: .Alert )
        
        alertSaved.addAction(UIAlertAction(
            title: "OK"
            , style: .Default
            , handler: nil )
        )
        
        self.presentViewController(alertSaved, animated: true, completion: nil)
        
    }
    
/*
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header:UIImageView = UIImageView(image: UIImage(named: "header"))
        return header
    }
*/

    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 48
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 75
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if let nomeMontadora = carrosArray[section]["Montadora"] as? String{
            return nomeMontadora
        }
        
        return nil
    }
    
    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer:UIImageView = UIImageView(image: UIImage(named: "footer"))
        return footer
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("paraMostrarOCarro", sender: indexPath)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    
        
        
        if editingStyle == .Delete {
            // Delete the row from the data source
            
            
            if var array = carrosArray[indexPath.section]["Carros"]? as? [String] {
                
                // Remove do ARRAY criado acima
                array.removeAtIndex(indexPath.row)
                
                // Sobreescreve a parada toda.
                carrosArray[indexPath.section]["Carros"] = array
                
            }
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
            
            
            
            
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
        
        
        
    }
    

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        
        var carros = carrosArray[indexPath.section]["Carros"]?[indexPath.row] as! String
       
        if( carros == "Fusca" ){
            return false
        }
        
        return true
    }
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        var vc = segue.destinationViewControlleras!s ShowCarroViewController
        
        let indexPath = sender as! NSIndexPath
    
        let montadoraDict = carrosArray[indexPath.section]
        
        var carToShow = "Vazio"
        
        if let carros = montadoraDict["Carros"] as? [String]{
            carToShow = carros[indexPath.row]
        }
        
        vc.carroA = carToShow
        
    }


}
