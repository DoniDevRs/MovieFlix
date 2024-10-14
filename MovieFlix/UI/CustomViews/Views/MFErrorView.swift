//
//  MFErrorView.swift
//  MovieFlix
//
//  Created by Doni Silva on 25/09/24.
//

import UIKit

public struct ErrorViewEntity {
    
    public enum Constants {
        static let title = "titleError".localized
        static let description = "descriptionError".localized
        static let buttonTitle = "buttonReloadTitle".localized
    }
    
    public let title: String?
    public let description: String?
    public let buttonTitle: String?
    public let image: UIImage?
    
    public init(title: String?, description: String?, buttonTitle: String?, image: UIImage? = nil) {
        self.title = title
        self.description = description
        self.buttonTitle = buttonTitle
        self.image = image
    }
    
    public static func makeCustomError() -> ErrorViewEntity {
        ErrorViewEntity(title: Constants.title,
                        description: Constants.description,
                        buttonTitle: Constants.buttonTitle,
                        image: .imageErrorX)
    }
}

public protocol ErrorViewDelegate: AnyObject {
    func didTapErrorButton()
}

public final class MFErrorView: UIView {
    
    private enum Constants {
        static let buttonCornerRadius: CGFloat = 7.5
        static let bottomConstraint: CGFloat = 60
        static let buttonHeight: CGFloat = 45
    }
    
    public weak var delegate: ErrorViewDelegate?
    
    // MARK: - UI
    
    private lazy var view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    private lazy var centerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = Metrics.small
        return stackView
    }()
    
    private lazy var imageErrorView: UIImageView = {
        let imageEmpty = UIImageView()
        imageEmpty.translatesAutoresizingMaskIntoConstraints = false
        imageEmpty.contentMode = .scaleAspectFit
        imageEmpty.image = .imageErrorX
        return imageEmpty
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = .zero
        label.font = UIFont.systemFont(ofSize: Metrics.medium, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    private lazy var titleDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = .zero
        label.font = UIFont.systemFont(ofSize: Metrics.small, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    private lazy var errorButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.didTapErrorButton), for: .touchUpInside)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .orange
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: Metrics.small)
        button.clipsToBounds = true
        button.layer.cornerRadius = Constants.buttonCornerRadius
        button.backgroundColor = .systemOrange
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - PRIVATE
    
    private func setup() {
        backgroundColor = .systemBackground
        buildViewHierarchy()
        addConstraints()
    }
    
    private func buildViewHierarchy() {
        addSubview(view)
        view.addSubview(centerView)
        view.addSubview(errorButton)
        centerView.addSubview(stackView)
        stackView.addArrangedSubview(imageErrorView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(titleDescription)
    }
    
    private func addConstraints() {
        view.constraintToSuperView()
        
        errorButton
            .leadingTo(view.leadingAnchor, constant: Metrics.small)
            .trailingTo(view.trailingAnchor, constant: Metrics.small)
            .bottomTo(view.safeAreaLayoutGuide.bottomAnchor, constant: Constants.bottomConstraint)
            .height(Constants.buttonHeight)
        
        centerView
            .topToGreather(view.topAnchor, constant: Metrics.small)
            .centerYTo(view.centerYAnchor)
            .leadingTo(view.leadingAnchor, constant: Metrics.small)
            .trailingTo(view.trailingAnchor, constant: Metrics.small)
            .bottomToLess(errorButton.topAnchor, constant: Metrics.small)
        
        stackView.constraintToSuperView()
    }
    
    @objc private func didTapErrorButton() {
        delegate?.didTapErrorButton()
    }
    
    public func updateView(with entity: ErrorViewEntity) {
        titleLabel.text = entity.title
        titleDescription.text = entity.description
        errorButton.setTitle(entity.buttonTitle, for: .normal)
        imageErrorView.image = .imageErrorX
    }
}
