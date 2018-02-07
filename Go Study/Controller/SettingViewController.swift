//
//  SettingViewController.swift
//  Go Study
//
//  Created by Himself65 on 2018/2/6.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import UIKit
import CoreData

class SettingViewController: UIViewController {
    
    @IBOutlet weak var returnButton: UIBarButtonItem!
    @IBOutlet weak var scrollView: UIScrollView!
    
    static let shared = CoreDataManager()
    lazy var context: NSManagedObjectContext = {
        let context = ((UIApplication.shared.delegate) as! AppDelegate).context
        return context
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let request: NSFetchRequest = User.fetchRequest()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func exitThisPage(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
