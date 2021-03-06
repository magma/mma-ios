// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: metricsd.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

// Copyright (c) 2016-present, Facebook, Inc.
// All rights reserved.
//
// This source code is licensed under the BSD-style license found in the
// LICENSE file in the root directory of this source tree. An additional grant
// of patent rights can be found in the PATENTS file in the same directory.

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

public struct Magma_Orc8r_MetricsContainer {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var gatewayID: String = String()

  /// TODO: we should strip this out of metricsd (or duplicate it ourselves)
  /// Prometheus 2 no longer supports protobuf client model
  public var family: [Magma_Orc8r_MetricFamily] = []

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Magma_Orc8r_PushedMetric {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var metricName: String = String()

  public var value: Double = 0

  public var timestampMs: Int64 = 0

  public var labels: [Magma_Orc8r_LabelPair] = []

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Magma_Orc8r_PushedMetricsContainer {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var networkID: String = String()

  public var metrics: [Magma_Orc8r_PushedMetric] = []

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Magma_Orc8r_Void {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "magma.orc8r"

extension Magma_Orc8r_MetricsContainer: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".MetricsContainer"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "gatewayId"),
    2: .same(proto: "family"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.gatewayID)
      case 2: try decoder.decodeRepeatedMessageField(value: &self.family)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.gatewayID.isEmpty {
      try visitor.visitSingularStringField(value: self.gatewayID, fieldNumber: 1)
    }
    if !self.family.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.family, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Magma_Orc8r_MetricsContainer, rhs: Magma_Orc8r_MetricsContainer) -> Bool {
    if lhs.gatewayID != rhs.gatewayID {return false}
    if lhs.family != rhs.family {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Magma_Orc8r_PushedMetric: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".PushedMetric"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "metricName"),
    2: .same(proto: "value"),
    3: .same(proto: "timestampMS"),
    4: .same(proto: "labels"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.metricName)
      case 2: try decoder.decodeSingularDoubleField(value: &self.value)
      case 3: try decoder.decodeSingularInt64Field(value: &self.timestampMs)
      case 4: try decoder.decodeRepeatedMessageField(value: &self.labels)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.metricName.isEmpty {
      try visitor.visitSingularStringField(value: self.metricName, fieldNumber: 1)
    }
    if self.value != 0 {
      try visitor.visitSingularDoubleField(value: self.value, fieldNumber: 2)
    }
    if self.timestampMs != 0 {
      try visitor.visitSingularInt64Field(value: self.timestampMs, fieldNumber: 3)
    }
    if !self.labels.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.labels, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Magma_Orc8r_PushedMetric, rhs: Magma_Orc8r_PushedMetric) -> Bool {
    if lhs.metricName != rhs.metricName {return false}
    if lhs.value != rhs.value {return false}
    if lhs.timestampMs != rhs.timestampMs {return false}
    if lhs.labels != rhs.labels {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Magma_Orc8r_PushedMetricsContainer: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".PushedMetricsContainer"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "networkId"),
    2: .same(proto: "metrics"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.networkID)
      case 2: try decoder.decodeRepeatedMessageField(value: &self.metrics)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.networkID.isEmpty {
      try visitor.visitSingularStringField(value: self.networkID, fieldNumber: 1)
    }
    if !self.metrics.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.metrics, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Magma_Orc8r_PushedMetricsContainer, rhs: Magma_Orc8r_PushedMetricsContainer) -> Bool {
    if lhs.networkID != rhs.networkID {return false}
    if lhs.metrics != rhs.metrics {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Magma_Orc8r_Void: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Void"
  public static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Magma_Orc8r_Void, rhs: Magma_Orc8r_Void) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
