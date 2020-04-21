import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitor.ionicframework.com/docs/plugins/ios
 */
@objc(Diskspace)
public class Diskspace: CAPPlugin {

  enum DiskSpaceError : Error {
    case couldNotEnumerateFSAttributes
    case couldNotRetrieveFSSize
    case couldNotRetrieveFSFreeSpace
  }

  @objc func get(_ call: CAPPluginCall) {
    switch diskspace() {
    case let .success(result):
      call.success(["value": result])
    case .failure(.couldNotRetrieveFSFreeSpace):
      call.reject("Could not retrieve Filesystem Free Space")
    case .failure(.couldNotRetrieveFSSize):
      call.reject("Could not retrieve Filesystem Size")
    case .failure(.couldNotEnumerateFSAttributes):
      call.reject("Could not enumerate Filesystem attributes")
    }
  }

  func diskspace() -> Result<[String: Int64], DiskSpaceError> {
    guard let lastPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last else {
      return .failure(.couldNotEnumerateFSAttributes)
    }

    guard let dict = try? FileManager.default.attributesOfFileSystem(forPath: lastPath) else {
      return .failure(.couldNotEnumerateFSAttributes)
    }

    guard let fsSizeInBytes = dict[.systemSize] as? NSNumber else {
      return .failure(.couldNotRetrieveFSSize)
    }

    guard let freeFsSizeInBytes = dict[.systemFreeSize] as? NSNumber else {
      return .failure(.couldNotRetrieveFSFreeSpace)
    }

    return Result.success([
      "size": fsSizeInBytes.int64Value,
      "free": freeFsSizeInBytes.int64Value
    ])
  }

}
