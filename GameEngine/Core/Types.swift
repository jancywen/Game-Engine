//
//  Types.swift
//  GameEngine
//
//  Created by wangwenjie on 2020/6/29.
//  Copyright © 2020 wangwenjie. All rights reserved.
//

import simd

protocol sizeable {
    static func size(_ count: Int) -> Int
    static func stride(_ count: Int) -> Int
}

extension sizeable {
    static func size() -> Int {
        return MemoryLayout<Self>.size
    }
    static func stride() -> Int {
        return MemoryLayout<Self>.stride
    }
    static func size(_ count: Int) -> Int {
        return MemoryLayout<Self>.size * count
    }
    static func stride(_ count: Int) -> Int {
        return MemoryLayout<Self>.stride * count
    }
}

struct Vertex {
    var position: float3
    var color: float4
}

extension Vertex: sizeable {}

extension float3: sizeable {}
