
import SwiftUI
import AVKit

struct PlayerView: UIViewRepresentable {
    let filename : String
    
    func makeUIView(context: Context) -> UIView {
        return PlayerUIView(frame: .zero, filename: filename)
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {
    }
    
    
}

class PlayerUIView: UIView {
    private let playerLayer = AVPlayerLayer()
    private var filename: String
    
    init(frame: CGRect, filename: String) {
            self.filename = filename
            super.init(frame: frame)
        
        if let fileURL = Bundle.main.url(forResource: filename, withExtension: "mp4") {
            let player = AVPlayer(url: fileURL)
            player.actionAtItemEnd = .none
            player.play()
            
            playerLayer.player = player
            playerLayer.videoGravity = .resizeAspectFill
            
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(playerItemDidReachEnd(notification:)),
                                                   name: .AVPlayerItemDidPlayToEndTime,
                                                   object: player.currentItem)

            layer.addSublayer(playerLayer)
        }
    }
    
    @objc func playerItemDidReachEnd(notification: Notification) {
        if let playerItem = notification.object as? AVPlayerItem {
            playerItem.seek(to: .zero, completionHandler: nil)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
}
