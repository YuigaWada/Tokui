//
//  EndPageViewController.swift
//  Tokui
//
//  Created by Yuiga Wada on 2019/06/30.
//  Copyright © 2019 Yuiga Wada. All rights reserved.
//

import UIKit

class EndPageViewController: UIViewController {

    
    public var alpha: CGFloat
    
    init(alpha : CGFloat)
    {
        self.alpha = alpha
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: alpha)
    }

    override func loadView() {
        let nib = UINib(nibName: "EndPageViewController", bundle:Bundle(identifier: "yuwd.Tokui"))
        self.view = nib.instantiate(withOwner: self).first as? UIView
    }
    
    
    
    @IBAction func ExitTutorial(_ sender: Any) {
        
        var vc = self.presentingViewController
        while(true)
        {
            if vc?.presentingViewController != nil
            {
                vc = vc?.presentingViewController
            }
            else
            {
                break
            }
        }
        
        vc?.dismiss(animated: true, completion: nil)
    }

    

}
