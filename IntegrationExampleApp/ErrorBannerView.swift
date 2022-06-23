import SwiftUI

class ErrorBannerView: UIView {
    
    let error: Error
    
    init(error: Error) {
        self.error = error
        super.init(frame: CGRect(x: 0, y: 0, width: 320, height: 100))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        addSubview(createErrorLabel())
    }
    
    func createErrorLabel() -> UILabel {
        let label = UILabel()
        label.text = "Error: \(error.localizedDescription)"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        label.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        label.widthAnchor.constraint(equalToConstant: 320).isActive = true
        label.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return label
    }
    
}
