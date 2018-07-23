//
//  ViewControllerTests.swift
//  TestAppTests
//
//  Created by Raunak Talwar on 23/07/18.
//  Copyright © 2018 Raunak Talwar. All rights reserved.
//
@testable import TestApp
import LayoutTest
import XCTest

class ViewControllerTests: LYTLayoutTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testViewControllerViewLayout() {
        runLayoutTests(withViewProvider: ViewController.self) { (view: Any, data: [AnyHashable : Any], context: Any?) -> Void in
            
        
        }
    }
}

extension ViewController: ViewProvider {
    public static func dataSpecForTest() -> [AnyHashable : Any] {
        return ["label1": StringValues(),
                "label2": StringValues()]
    }
    
    public static func view(forData data: [AnyHashable : Any],
                            reuse reuseView: UIView?,
                            size: ViewSize?,
                            context: AutoreleasingUnsafeMutablePointer<AnyObject?>?) -> UIView {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
        viewController.viewDidLoad()
        let label1Text = data["label1"] as? String
        viewController.label1.text = label1Text
        let label2Text = data["label1"] as? String
        viewController.label2.text = label2Text
        context?.pointee = viewController
        return viewController.view
    }
}
