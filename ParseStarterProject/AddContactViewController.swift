//
//  AddContactViewController.swift
//  OracaoProject
//
//  Created by Administrator on 6/29/18.
//  Copyright © 2018 Parse. All rights reserved.
//

import UIKit
import Parse

class AddContactViewController: UIViewController {

    @IBOutlet weak var txtContactName: UITextField!



    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addContact(_ sender: Any) {
        
        let ACL = PFACL()
        ACL.hasPublicReadAccess = true
        
        var contact = PFObject(className:"contact")
        contact["name"] = txtContactName.text
        contact.saveInBackground {
            (success: Bool, error: Error?) in
            if (success) {
                self.loadHomeScreen()
            } else {
                if let descrip = error?.localizedDescription{
                    self.displayErrorMessage(message: descrip)}
            }
        }
    }
        
    func displayErrorMessage(message:String) {
        let alertView = UIAlertController(title: "Error!", message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
        }
        alertView.addAction(OKAction)
        if let presenter = alertView.popoverPresentationController {
            presenter.sourceView = self.view
            presenter.sourceRect = self.view.bounds
        }
        self.present(alertView, animated: true, completion:nil)
    }
    
    func loadHomeScreen(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let loggedInViewController = storyBoard.instantiateViewController(withIdentifier: "Navigation") as! UINavigationController
        self.present(loggedInViewController, animated: true, completion: nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
