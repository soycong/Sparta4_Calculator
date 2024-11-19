//
//  CalculatorView.swift
//  Sparta4_Calculator
//
//  Created by seohuibaek on 11/19/24.
//
import UIKit

class CalculatorView: UIView {
    
    var buttonNumbers = ["7","8","9","+"]
    var numberButtons: [UIButton] = []
    
    lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.text = "12345"
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 60)
        label.textColor = .white
        label.backgroundColor = .black
        return label
    }()
    
    lazy var numberButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
        button.layer.cornerRadius = 40
        button.frame.size.height = 80
        button.frame.size.width = 80
        return button
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.black

        configureNumberLabel()
        configureNumberButtons() // 여기서 스택뷰 추가 및 제약 설정을 호출합니다.
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
    
    func makeButton(withTitle title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)  // 이 부분을 추가하여 버튼에 제목을 설정
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
        button.layer.cornerRadius = 40
        button.frame.size.height = 80
        button.frame.size.width = 80
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    func makeHorizontalStackView(withTitle titles: [String]) -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.backgroundColor = .black
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        titles.forEach { title in
            let button = makeButton(withTitle: title)
            stackView.addArrangedSubview(button)
        }
        return stackView
    }
    
    func configureNumberButtons() {
        // 스택뷰 생성
        let numberStackView = makeHorizontalStackView(withTitle: buttonNumbers)
        
        // 스택뷰를 CalculatorView에 추가
        addSubview(numberStackView)
        
        // 스택뷰 제약 설정
        NSLayoutConstraint.activate([
            numberStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            numberStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            numberStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30),
            numberStackView.heightAnchor.constraint(equalToConstant: 80) // 버튼 높이에 맞춘 높이 설정
        ])
    }
    
}
