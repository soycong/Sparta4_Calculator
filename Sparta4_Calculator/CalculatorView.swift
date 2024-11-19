//
//  CalculatorView.swift
//  Sparta4_Calculator
//
//  Created by seohuibaek on 11/19/24.
//
import UIKit

class CalculatorView: UIView {
    
    lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.text = "12345"
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 60)
        label.textColor = .white
        label.backgroundColor = .black
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.black

        configureNumberLabel()
    }
    
    func configureNumberLabel() {
        addSubview(numberLabel)
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            numberLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 200),
            numberLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            numberLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            numberLabel.heightAnchor.constraint(equalToConstant: 100) // 원하는 높이 설정
        ])
    }
    
}
    
