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
        label.text = "0"
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 60)
        label.textColor = .white
        label.backgroundColor = .black
        return label
    }()
    
    var buttonNumbers = [["7","8","9","+"],
                         ["4","5","6","-"],
                         ["1","2","3","*"],
                         ["AC", "0","=","/"]]
    
    var numberButtons: [UIButton] = [] // 버튼 저장
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.black

        configureNumberLabel()
        configureNumberButtons()
    }
    
    func configureNumberLabel() {
        addSubview(numberLabel)
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            numberLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 200),
            numberLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            numberLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            numberLabel.heightAnchor.constraint(equalToConstant: 100) // 원하는 높이 설정
        ])
    }
    
    func configureNumberButtons() {
        let numberStackView = makeVerticalStackView(withTitles: buttonNumbers) // 스택뷰 생성

        addSubview(numberStackView)

        NSLayoutConstraint.activate([
            numberStackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            numberStackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            numberStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            numberStackView.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: 60),
            numberStackView.widthAnchor.constraint(equalToConstant: 350)
        ])
    }
    
    func makeButton(withTitle title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        
        button.frame.size = CGSize(width: 80, height: 80)
        button.layer.cornerRadius =  button.frame.size.height / 2
        
        // 특정 버튼을 주황색으로 설정
        if title == "AC" || title == "=" || title == "+" || title == "-" || title == "*" || title == "/" {
            button.backgroundColor = UIColor.orange
        } else {
            button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
        }
        
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
        stackView.heightAnchor.constraint(equalToConstant: 80).isActive = true

        titles.forEach { title in
            let button = makeButton(withTitle: title)
            numberButtons.append(button)
            stackView.addArrangedSubview(button)
        }
        return stackView
    }
    
    func makeVerticalStackView(withTitles titlesArray: [[String]]) -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.backgroundColor = .black
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        titlesArray.forEach { titles in
            let horizontalStackView = makeHorizontalStackView(withTitle: titles)
            stackView.addArrangedSubview(horizontalStackView)
        }
        
        return stackView
    }
}
