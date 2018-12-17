//
// Copyright (c) 2015 Recruit Marketing Partners Co.,Ltd. All rights reserved.
// Copyright (c) 2018 Yuichi Hirano
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

// How to setup
//
// 1. Import RMPZoomTransitionAnimator_Swift
// 2. Adopt RMPZoomTransitionAnimating
// 3. Implement RMPZoomTransitionAnimating protocol

import UIKit
import RMPZoomTransitionAnimator_Swift

class ImageTablePushTransitionViewController: ImageTableViewController {
}

// MARK: - RMPZoomTransitionAnimating

extension ImageTablePushTransitionViewController: RMPZoomTransitionAnimating {
    var transitionSourceImageView: UIImageView {
        let selectedIndexPath = self.tableView.indexPathForSelectedRow!
        let cell = self.tableView.cellForRow(at: selectedIndexPath) as! ImageTableViewCell
        let imageView = UIImageView(image: cell.mainImageView.image)
        imageView.contentMode = cell.mainImageView.contentMode;
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = false
        var frameInSuperview = cell.mainImageView.convert(cell.mainImageView.frame, to: self.tableView.superview)
        frameInSuperview.origin.x -= 8 // Left margin of ImageView from Cell
        frameInSuperview.origin.y -= 8 // Top margin of ImageView from Cell
        imageView.frame = frameInSuperview
        return imageView
    }

    var transitionSourceBackgroundColor: UIColor? {
        return self.tableView.backgroundColor
    }

    var transitionDestinationImageViewFrame: CGRect {
        let selectedIndexPath = self.tableView.indexPathForSelectedRow!
        let cell = self.tableView.cellForRow(at: selectedIndexPath) as! ImageTableViewCell
        var frameInSuperview = cell.mainImageView.convert(cell.mainImageView.frame, to: self.tableView.superview)
        frameInSuperview.origin.x -= 8 // Left margin of ImageView from Cell
        frameInSuperview.origin.y -= 8 // Top margin of ImageView from Cell
        return frameInSuperview
    }
}
