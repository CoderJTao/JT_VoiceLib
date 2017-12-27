//
//  PlayContainerViewController.swift
//  JT_VoiceLib
//
//  Created by 江涛 on 2017/12/27.
//  Copyright © 2017年 江涛. All rights reserved.
//

import UIKit

class PlayContainerViewController: UIViewController {
    
    var list: [TracksJsonModel]?
    
    @IBOutlet weak var listTableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.listTableView.transform = CGAffineTransform.init(translationX: 0, y: 440)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.3) {
            self.listTableView.transform = CGAffineTransform.identity
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.3, animations: {
            self.listTableView.transform = CGAffineTransform.init(translationX: 0, y: 440)
        }) { (finished) in
            if finished{
                self.view.isHidden = true
            }
        }
    }
    
}
