import UIKit

class CalculatorView: UIView {
        
    lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .black
        label.textColor = .white
        label.text = "0"
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 60)
        
        return label
    }()
    
    var buttonNumbers = [["7","8","9","+"],
                         ["4","5","6","-"],
                         ["1","2","3","*"],
                         ["AC", "0","=","/"]]
    
    var numberButtons: [UIButton] = []
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.black

        configureNumberLabel() // 계산기 라벨 생성
        configureNumberButtons() // 계산기 버튼 생성
    }
    
    func configureNumberLabel() {
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(numberLabel)
        
        NSLayoutConstraint.activate([
            numberLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            numberLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            numberLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 200),
            numberLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func configureNumberButtons() {
        let numberStackView = makeVerticalStackView(withTitles: buttonNumbers)

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
        
        // 연산자, 특수버튼과 숫자 버튼 배경 분리
        button.backgroundColor = ["AC","=","+", "-", "*", "/"].contains(title) ?
            .orange : UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }
    
    // 수평 StackView
    func makeHorizontalStackView(withTitle titles: [String]) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.backgroundColor = .black
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        stackView.translatesAutoresizingMaskIntoConstraints = false

        titles.forEach { title in
            let button = makeButton(withTitle: title)
            numberButtons.append(button)
            stackView.addArrangedSubview(button)
        }
        
        return stackView
    }
    
    // 수직 StackView
    func makeVerticalStackView(withTitles titlesArray: [[String]]) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.backgroundColor = .black
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.widthAnchor.constraint(equalToConstant: 350).isActive = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        titlesArray.forEach { titles in
            let horizontalStackView = makeHorizontalStackView(withTitle: titles)
            stackView.addArrangedSubview(horizontalStackView)
        }
        
        return stackView
    }
}
