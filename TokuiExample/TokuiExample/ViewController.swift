//
//  ViewController.swift
//  TokuiExample
//
//  Created by Yuiga Wada on 2019/06/24.
//  Copyright © 2019 Yuiga Wada. All rights reserved.
//

import UIKit
import Tokui

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var TokuiLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func Tap(_ sender: Any) {
        let Tokui = TokuiViewController(alpha:0.8 , displayDots:true)

        Tokui.add(target: button , message:"You tapped here." , position: .above)
        Tokui.add(target: TokuiLabel , message:"Tokui is a comedian of the \n Japanese comedy duo \'Tutorial\'.")
        
        Tokui.PreparePages()
        
        Tokui.modalTransitionStyle = .crossDissolve
        self.present(Tokui, animated: true, completion: nil)
        
    }
    
}

