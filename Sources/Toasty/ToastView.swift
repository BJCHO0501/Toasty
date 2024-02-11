import UIKit
import SnapKit

public protocol ToastViewType {
    var iconImage: UIImage? { get set }
    var content: String? { get set }
}

open class ToastView: UIView, ToastViewType {

    public var iconImage: UIImage? {
        set { iconImageView.image = newValue }
        get { iconImageView.image }
    }

    public var content: String? {
        set { contentLabel.text = newValue }
        get { contentLabel.text }
    }

    private let contentLabel = UILabel()
    private let iconImageView = UIImageView()

    public init(
        backgroundColor: UIColor? = nil,
        iconImage: UIImage? = nil,
        content: String? = nil
    ) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.iconImage = iconImage
        self.content = content
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override open func layoutSubviews() {
        [iconImageView, contentLabel].forEach(addSubview(_:))
        iconImageView.snp.makeConstraints {
            $0.width.height.equalTo(20)
            $0.bottom.equalToSuperview().offset(-24)
            $0.leading.equalToSuperview().inset(25)
        }
        contentLabel.snp.makeConstraints {
            $0.centerY.equalTo(iconImageView)
            $0.leading.equalTo(iconImageView.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().inset(16)
        }
        self.snp.makeConstraints {
            $0.width.equalToSuperview()
        }
    }
}
