//
//  CalculatorViewController.swift
//  Sparta4_Calculator
//
//  Created by seohuibaek on 11/14/24.
//

import UIKit

class CalculatorViewController: UIViewController {
    lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.text = "12345"
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 60)
        label.textColor = .white
        label.backgroundColor = .black
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNumberLabel()
        //view.backgroundColor = .black

        // Do any additional setup after loading the view.
    }
    
    func configureNumberLabel() {
        view.addSubview(numberLabel)
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            numberLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            numberLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            numberLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            numberLabel.heightAnchor.constraint(equalToConstant: 100) // 원하는 높이 설정
        ])
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
