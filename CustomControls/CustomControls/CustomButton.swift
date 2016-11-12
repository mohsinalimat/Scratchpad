import Foundation
import UIKit

@IBDesignable // Make Properties available for Interface Builder

class CustomIconButton : UIControl {
    
    @IBInspectable public var padding: CGFloat = 1.0 {
        didSet {
            self.setNeedsLayout()
            self.layoutIfNeeded()
        }
    }
    
    @IBInspectable public var textColor: UIColor? {
        didSet {
            self.label.textColor = textColor
        }
    }

    @IBInspectable public var text : String? {
        didSet {
            self.label.text = self.text
        }
    }
    
    lazy private var label : UILabel  = {
        var tempLabel = UILabel()
        return tempLabel
    }()
    
    private func prepareView() {
        self.addSubview(self.label)
        self.label.textAlignment = .center
        let tapRec = UITapGestureRecognizer(target: self, action: #selector(tapped(sender:)))
        self.addGestureRecognizer(tapRec)
    }
    
    private func prepareUI() {
        self.label.frame = self.bounds
        self.translatesAutoresizingMaskIntoConstraints = false
        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.gray
        self.layer.cornerRadius = 4.0
        self.layer.masksToBounds = true
    }
    
    override var intrinsicContentSize: CGSize {
        let size = CGSize(width: self.label.intrinsicContentSize.width + padding, height: self.label.intrinsicContentSize.height + padding)
        return size
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.prepareView()
        self.prepareUI()

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.prepareView()
        self.prepareUI()
    }

    override func prepareForInterfaceBuilder() {
        self.prepareUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.prepareUI()
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        print("Begin tracking ")
        self.label.textColor = UIColor.red
        return true
    }
    
    override func cancelTracking(with event: UIEvent?) {
        self.label.textColor = self.textColor
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        self.label.textColor = self.textColor
    }
}


// Interaction

extension CustomIconButton {
    @objc fileprivate func tapped(sender: Any?) {
        print("Button pressed")
        self.sendActions(for: .touchUpInside)
    }
}
