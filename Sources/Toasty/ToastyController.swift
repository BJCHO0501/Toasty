import UIKit

public protocol ToastyControllerType {
   func present(with toast: ToastyViewType)
}

open class ToastyController: UIViewController, ToastyControllerType {

    public init (target: UIViewController) {
        super.init(nibName: nil, bundle: nil)
        target.addChild(self)
        view.isUserInteractionEnabled = false
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func present(with toast: ToastyViewType) {
        guard let toastView = toast as? UIView else { return }
        view.addSubview(toastView)

        toastView.snp.makeConstraints {
            $0.height.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(view.snp.top)
        }

        UIView.animateKeyframes(
            withDuration: 4,
            delay: 0,
            animations: {
                UIView.addKeyframe(
                    withRelativeStartTime: 0,
                    relativeDuration: 0.005 / 4,
                    animations: { toastView.transform = .init(translationX: 0, y: self.view.safeAreaInsets.top + 50) }
                )

                UIView.addKeyframe(
                    withRelativeStartTime: 3 / 4,
                    relativeDuration: 0.1 / 4,
                    animations: { toastView.transform = .identity }
                )
            },
            completion: { _ in toastView.removeFromSuperview()  }
        )
    }
}
