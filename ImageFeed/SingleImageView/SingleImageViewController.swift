import UIKit

final class SingleImageViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var scrollView: UIScrollView!
    var image: UIImage? {
        didSet {
            guard isViewLoaded, let image else {return}
            imageView.image = image
            imageView.frame.size = image.size
            rescaleAndCenterImageInScrollView(image: image)
        }
    }
    
    @IBAction private func didTapBackButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction private func didTapShareButton(_ sender: Any) {
        guard let image else {return}
        let share = UIActivityViewController(
            activityItems: [image],
            applicationActivities: nil
        )
        present(share, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.minimumZoomScale = 0.1
        scrollView.maximumZoomScale = 5.25
        
        guard let image else { return }
        imageView.image = image
        imageView.frame.size = image.size
        rescaleAndCenterImageInScrollView(image: image)
    }
    
    private func rescaleAndCenterImageInScrollView(image: UIImage) {
        let minZoomScale = scrollView.minimumZoomScale
        let maxZoomScale = scrollView.maximumZoomScale
        view.layoutIfNeeded()
        let visibleRectSize = scrollView.bounds.size
        let imageSize = image.size
        let hScale = visibleRectSize.width / imageSize.width
        let vScale = visibleRectSize.height / imageSize.height
        let computedScale = min(hScale, vScale)
        let scale = min(maxZoomScale,
                        max(minZoomScale, computedScale))
        scrollView.setZoomScale(scale, animated: true)
        scrollView.layoutIfNeeded()
        let newContentSize = scrollView.contentSize
        let xOffset = (newContentSize.width - visibleRectSize.width) / 2
        let yOffset = (newContentSize.height - visibleRectSize.height) / 2
        scrollView.setContentOffset(CGPoint(x: xOffset, y: yOffset), animated: false)
        
    }
}

extension SingleImageViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        imageView
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        let visibleRectSize = scrollView.bounds.size
        let newContentSize = scrollView.contentSize
        print("End Zooming \(newContentSize)")
        
        let xInset = (newContentSize.width - visibleRectSize.width) / 2
        let yInset = (newContentSize.height - visibleRectSize.height) / 2
        print("Offset x \(xInset)")
        
        if (xInset < 0) {
            scrollView.contentInset.left = -xInset

        }
        if (yInset < 0) {
            scrollView.contentInset.top = -yInset
        }
    }
}
