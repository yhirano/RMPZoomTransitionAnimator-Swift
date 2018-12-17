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

class ImageCollectionPushTransitionViewController: ImageCollectionViewController {
}

// MARK: - RMPZoomTransitionAnimating

extension ImageCollectionPushTransitionViewController: RMPZoomTransitionAnimating {
    var transitionSourceImageView: UIImageView {
        let selectedIndexPath = self.collectionView.indexPathsForSelectedItems!.first!
        let cell = self.collectionView.cellForItem(at: selectedIndexPath) as! ImageCollectionViewCell
        let imageView = UIImageView(image: cell.imageView.image)
        imageView.contentMode = cell.imageView.contentMode;
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = false
        imageView.frame = cell.imageView.convert(cell.imageView.frame, to: self.collectionView.superview)
        return imageView;
    }

    var transitionSourceBackgroundColor: UIColor? {
        return self.collectionView.backgroundColor
    }

    var transitionDestinationImageViewFrame: CGRect {
        let selectedIndexPath = self.collectionView.indexPathsForSelectedItems!.first!
        let cell = self.collectionView.cellForItem(at: selectedIndexPath) as! ImageCollectionViewCell
        let cellFrameInSuperview = cell.imageView.convert(cell.imageView.frame, to: self.collectionView.superview)
        return cellFrameInSuperview
    }
}
