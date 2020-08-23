
import Cocoa
import HNAPI

class ItemViewController: NSViewController {

    @IBOutlet var titleLabel: NSTextField!
    @IBOutlet var urlButton: NSButton!
    @IBOutlet var authorGroup: NSStackView!
    @IBOutlet var authorLabel: NSTextField!
    @IBOutlet var pointsGroup: NSStackView!
    @IBOutlet var pointsLabel: NSTextField!
    @IBOutlet var commentCountGroup: NSStackView!
    @IBOutlet var commentCountLabel: NSTextField!
    @IBOutlet var creationLabel: NSTextField!

    let formatter = RelativeDateTimeFormatter()

    var item: TopLevelItem? {
        didSet {
            guard let item = item else { return }
            switch item {
            case .story(let story):
                titleLabel.stringValue = story.title
                if let host = story.content.url?.host {
                    urlButton.isHidden = false
                    urlButton.title = host
                } else {
                    urlButton.isHidden = true
                }
                authorGroup.isHidden = false
                authorLabel.stringValue = story.author
                pointsGroup.isHidden = false
                pointsLabel.stringValue = String(story.points)
                commentCountGroup.isHidden = false
                commentCountLabel.stringValue = String(story.commentCount)
                creationLabel.stringValue = formatter.localizedString(for: story.creation, relativeTo: Date())
            case .job(let job):
                titleLabel.stringValue = job.title
                authorGroup.isHidden = true
                pointsGroup.isHidden = true
                commentCountGroup.isHidden = true
                creationLabel.stringValue = formatter.localizedString(for: job.creation, relativeTo: Date())
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
}
