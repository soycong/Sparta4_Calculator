//
//  CalculatorViewController.swift
//  Sparta4_Calculator
//
//  Created by seohuibaek on 11/14/24.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var calculatorView: CalculatorView!
   // var calculatorModel = CalculatorModel()

    override func loadView() {
        calculatorView = CalculatorView()
        view = calculatorView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .black

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
