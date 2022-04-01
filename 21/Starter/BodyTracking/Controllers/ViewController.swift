/// Copyright (c) 2021 Jayven Nhan
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit
import ARKit
import RealityKit

final class ViewController: UIViewController {
  // MARK: - Value Types

  // MARK: - IBOutlets
  @IBOutlet var arView: ARView!
  @IBOutlet weak var shoulderRaiseStageLabel: UILabel!
  @IBOutlet weak var repetitionLabel: UILabel!

  // MARK: - Stored Properties

  // MARK: - Computed Properties

  // MARK: - View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    arView.session.delegate = self
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    resetTrackingConfiguration()
    loadRiggedModelAsync()
  }

  // MARK: - Tracking
  private func resetTrackingConfiguration() {
  }

  // MARK: - Body Tracked Entity
  private func loadRiggedModelAsync() {
  }

  // MARK: - Model Entity Factory
  private static func makeBallModelEntity(
    color: UIColor = .customOrange) -> ModelEntity {
    let sphereMesh = MeshResource.generateSphere(
      radius: 0.06)
    let simpleMaterial = SimpleMaterial(
      color: color,
      isMetallic: false)
    let modelEntity = ModelEntity(
      mesh: sphereMesh,
      materials: [simpleMaterial])
    return modelEntity
  }

  private static func makeBoxModelEntity() -> ModelEntity {
    let boxMesh = MeshResource.generateBox(width: 0.3, height: 0.02, depth: 0.2)
    let simpleMaterial = SimpleMaterial(
      color: .black,
      isMetallic: false)
    let modelEntity = ModelEntity(
      mesh: boxMesh,
      materials: [simpleMaterial])
    return modelEntity
  }
}

// MARK: - ARSessionDelegate
extension ViewController: ARSessionDelegate {
  func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
  }
}

