//
//  ViewController.swift
//  YourFeatureName
//
//  Created by KIM HOSE on 2022/06/30.
//  Copyright © 2022 com.jstock. All rights reserved.
//

import Foundation
import UIKit

import RxCocoa
import RxSwift

public final class ViewController: UIViewController {


  private let resultLabel: UILabel = {
    let label = UILabel()

    label.backgroundColor = .white
    label.font = .systemFont(ofSize: 40, weight: .bold)
    label.text = "Default"
    label.textColor = .purple
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false

    return label
  }()

  private let button: UIButton = {
    let button = UIButton()

    button.setTitle("서버연결하기", for: .normal)
    button.setTitleColor(UIColor.white, for: .normal)
    button.backgroundColor = .blue
    button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.layer.cornerRadius = 14

    return button
  }()


  private let disposeBag = DisposeBag()
  private let viewModel = ViewModel()




  public init() {
    super.init(nibName: nil, bundle: nil)

    setupViews()

  }
  public required init?(coder: NSCoder) {
    super.init(coder: coder)

    setupViews()

  }

  public override func viewDidLoad() {
    super.viewDidLoad()
    bind()
  }


  private func bind() {
    let input = ViewModel.Input(tapButton: button.rx.tap.asObservable())


    let output = viewModel.transform(input: input)

    output.didTapButton
      .subscribe(onNext: { _ in
        print()
      })
      .disposed(by: disposeBag)
  }




  private func setupViews() {
    view.addSubview(resultLabel)
    view.addSubview(button)


    NSLayoutConstraint.activate([
      resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      resultLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),

      button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      button.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 200),
      button.heightAnchor.constraint(equalToConstant: 48)
    ])

  }
}
