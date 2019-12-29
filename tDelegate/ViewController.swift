//
//  ViewController.swift
//  tDelegate
//
//  Created by tyobigoro_i on 2019/12/29.
//  Copyright © 2019 tyobigoro_i. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MyDelegate {

    var viewdata = ViewData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var controllers:[UIViewController] = []
        guard let topController = viewdata.getViewController("TEST") as? TestViewController else { return }
        topController.myDelegate = self
        controllers.append(topController)
        
    }

    func myTest() {
          print("")
    }
    
}

class TestViewController: UITableViewController{
    
    var myDelegate: MyDelegate?

    override func viewDidLoad() {
            super.viewDidLoad()
     }
    
    func doSomething() {
        myDelegate?.myTest()
    }
}

protocol MyDelegate {
    
    func myTest()
    
}

class ViewData{

  func getViewController(_ text:String) -> UIViewController? {
    switch text {
    case "TEST" :
        let storyboard:UIStoryboard = UIStoryboard(name:"Main",bundle:nil)
        let TestView = storyboard.instantiateViewController(withIdentifier: "TEST") as! TestViewController
        return TestView

      default: fatalError("getViewController")
    }
  }

}
