//
//  WifiNetworkMetrics.swift
//  mma-ios
//
//  Created by Rodrigo Saravia on 11/13/20.
//

import Foundation

///This class handles the GRPC creation of Wi-Fi bundles and metrics that will be pushed using MetricsManager.
public class WifiNetworkMetrics {
    
    private let uuidManager = UUIDManager.shared
    private let wifiNetworkinfo = WifiNetworkInfo.shared
    
    //Label Names
    private let ssidLabelName : String = "ssid"
    private let bssidLabelName : String = "bssid"

    //Family Names
    private let wifiNetworkInfoFamilyName = "ios_wifi_network_info"
    
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
            $0.name = self.wifiNetworkInfoFamilyName
            $0.metric = metrics
            $0.type = .gauge
        }
        
        return family
    }
    
    public func CollectWifiNetworkInfoMetrics() -> Magma_Orc8r_MetricsContainer {
        
        var wifiNetworkInfoFamilies = [Magma_Orc8r_MetricFamily]()
        wifiNetworkInfoFamilies.append(CreateGRPCStringMetric(labelName: self.ssidLabelName, labelValue: self.wifiNetworkinfo.getSSID()))
        wifiNetworkInfoFamilies.append(CreateGRPCStringMetric(labelName: self.bssidLabelName, labelValue: self.wifiNetworkinfo.getBSSID()))
        
        let wifiNetworkInfoContainer = Magma_Orc8r_MetricsContainer.with {
            $0.gatewayID = self.uuidManager.getUUID()
            $0.family = wifiNetworkInfoFamilies
        }
        
        return wifiNetworkInfoContainer
    }
}