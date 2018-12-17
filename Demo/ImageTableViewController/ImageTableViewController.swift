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

class ImageTableViewController: UITableViewController, RMPZoomTransitionDelegate {

    private let reuseIdentifier = "Cell"

    private let items = ["01.jpeg", "02.jpeg", "03.jpeg", "04.jpeg", "05.jpeg", "06.jpeg", "07.jpeg", "08.jpeg",
                         "09.jpeg", "10.jpeg", "11.jpeg", "12.jpeg", "13.jpeg", "14.jpeg", "15.jpeg", "16.jpeg"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Keep selection for back
        clearsSelectionOnViewWillAppear = false
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let selected = self.tableView.indexPathForSelectedRow?.row {
            segue.destination.title = items[selected]
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        guard let imageTableViewCell = cell as? ImageTableViewCell else {
            return cell
        }

        let fileName = items[indexPath.row]
        imageTableViewCell.mainImageView.image = UIImage(named: fileName)
        imageTableViewCell.titleLabel.text = fileName

        return imageTableViewCell
    }
}
