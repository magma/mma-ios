//
//  CellularNetworkMetrics.swift
//  mma-ios
//
//  Created by Rodrigo Saravia on 11/13/20.
//

import Foundation

///This class handles the GRPC creation of cellular  bundles and metrics that will be pushed using MetricsManager.
public class CellularNetworkMetrics {
    
    private let uuidManager = UUIDManager.shared
    private let cellularNetworkInfo : CellularNetworkInfo = CellularNetworkInfo()
    
    //Label Names
    private let carrierNameLabelName : String = "carrier_name"
    private let mobileNetworkCodeLabelName : String = "mobile_network_code"
    private let mobileCountryCodeLabelName : String = "mobile_country_code"
    private let isoCountryCodeLabelName : String = "iso_country_code"
    private let radiotechnologyLabelName : String = "radio_technology_code"
    
    //Family Names
    private let cellularNetworkInfoFamilyName = "ios_cellular_network_info"
    
    init(){
        
    }
    
    private func CreateGRPCStringMetric(labelName : String, labelValue : String) -> Magma_Orc8r_MetricFamily {
        let label : Magma_Orc8r_LabelPair = Magma_Orc8r_LabelPair.with {
            $0.name = labelName
            $0.value = labelValue
        }
        
        var labels : [Magma_Orc8r_LabelPair] = [Magma_Orc8r_LabelPair]()
        labels.append(label)
        
        //Use gauge with a value of one to be able to push a string
        let value : Magma_Orc8r_Gauge = Magma_Orc8r_Gauge.with {
            $0.value = 1
        }
        
        let metric = Magma_Orc8r_Metric.with {
            $0.label = labels
            $0.gauge = value
        }
        
        var metrics = [Magma_Orc8r_Metric]()
        metrics.append(metric)

        let family = Magma_Orc8r_MetricFamily.with {
            $0.name = self.cellularNetworkInfoFamilyName
            $0.metric = metrics
            $0.type = .gauge
        }
        
        return family
    }
    
    public func CollectCellularNetworkInfoMetrics() -> Magma_Orc8r_MetricsContainer {
        
        var cellularNetworkInfoFamilies = [Magma_Orc8r_MetricFamily]()
        cellularNetworkInfoFamilies.append(CreateGRPCStringMetric(labelName: self.carrierNameLabelName, labelValue: self.cellularNetworkInfo.getCarrierName()))
        cellularNetworkInfoFamilies.append(CreateGRPCStringMetric(labelName: self.mobileNetworkCodeLabelName, labelValue: self.cellularNetworkInfo.getMobileNetworkCode()))
        cellularNetworkInfoFamilies.append(CreateGRPCStringMetric(labelName: self.mobileCountryCodeLabelName, labelValue: self.cellularNetworkInfo.getMobileCountryCode()))
        cellularNetworkInfoFamilies.append(CreateGRPCStringMetric(labelName: self.isoCountryCodeLabelName, labelValue: self.cellularNetworkInfo.getIsoCountryCode()))
        cellularNetworkInfoFamilies.append(CreateGRPCStringMetric(labelName: self.radiotechnologyLabelName, labelValue: self.cellularNetworkInfo.getCurrentRadioAccessTechnology()))

        let cellularNetworkInfoContainer = Magma_Orc8r_MetricsContainer.with {
            $0.gatewayID = self.uuidManager.getUUID()
            $0.family = cellularNetworkInfoFamilies
        }
        
        return cellularNetworkInfoContainer
    }
}