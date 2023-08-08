// Auto-generated. Do not edit!

// (in-package sr_pkg.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class get_poseRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.gobal_pose = null;
    }
    else {
      if (initObj.hasOwnProperty('gobal_pose')) {
        this.gobal_pose = initObj.gobal_pose
      }
      else {
        this.gobal_pose = new Array(3).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type get_poseRequest
    // Check that the constant length array field [gobal_pose] has the right length
    if (obj.gobal_pose.length !== 3) {
      throw new Error('Unable to serialize array field gobal_pose - length must be 3')
    }
    // Serialize message field [gobal_pose]
    bufferOffset = _arraySerializer.float32(obj.gobal_pose, buffer, bufferOffset, 3);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type get_poseRequest
    let len;
    let data = new get_poseRequest(null);
    // Deserialize message field [gobal_pose]
    data.gobal_pose = _arrayDeserializer.float32(buffer, bufferOffset, 3)
    return data;
  }

  static getMessageSize(object) {
    return 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'sr_pkg/get_poseRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b66cee3a5439006360c9ac9364bbc7cf';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32[3] gobal_pose
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new get_poseRequest(null);
    if (msg.gobal_pose !== undefined) {
      resolved.gobal_pose = msg.gobal_pose;
    }
    else {
      resolved.gobal_pose = new Array(3).fill(0)
    }

    return resolved;
    }
};

class get_poseResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.count = null;
      this.pose1 = null;
      this.pose2 = null;
    }
    else {
      if (initObj.hasOwnProperty('count')) {
        this.count = initObj.count
      }
      else {
        this.count = 0;
      }
      if (initObj.hasOwnProperty('pose1')) {
        this.pose1 = initObj.pose1
      }
      else {
        this.pose1 = new Array(3).fill(0);
      }
      if (initObj.hasOwnProperty('pose2')) {
        this.pose2 = initObj.pose2
      }
      else {
        this.pose2 = new Array(3).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type get_poseResponse
    // Serialize message field [count]
    bufferOffset = _serializer.uint8(obj.count, buffer, bufferOffset);
    // Check that the constant length array field [pose1] has the right length
    if (obj.pose1.length !== 3) {
      throw new Error('Unable to serialize array field pose1 - length must be 3')
    }
    // Serialize message field [pose1]
    bufferOffset = _arraySerializer.float32(obj.pose1, buffer, bufferOffset, 3);
    // Check that the constant length array field [pose2] has the right length
    if (obj.pose2.length !== 3) {
      throw new Error('Unable to serialize array field pose2 - length must be 3')
    }
    // Serialize message field [pose2]
    bufferOffset = _arraySerializer.float32(obj.pose2, buffer, bufferOffset, 3);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type get_poseResponse
    let len;
    let data = new get_poseResponse(null);
    // Deserialize message field [count]
    data.count = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [pose1]
    data.pose1 = _arrayDeserializer.float32(buffer, bufferOffset, 3)
    // Deserialize message field [pose2]
    data.pose2 = _arrayDeserializer.float32(buffer, bufferOffset, 3)
    return data;
  }

  static getMessageSize(object) {
    return 25;
  }

  static datatype() {
    // Returns string type for a service object
    return 'sr_pkg/get_poseResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '51b363c4cafc22f07a22924380562686';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 count 
    float32[3] pose1
    float32[3] pose2
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new get_poseResponse(null);
    if (msg.count !== undefined) {
      resolved.count = msg.count;
    }
    else {
      resolved.count = 0
    }

    if (msg.pose1 !== undefined) {
      resolved.pose1 = msg.pose1;
    }
    else {
      resolved.pose1 = new Array(3).fill(0)
    }

    if (msg.pose2 !== undefined) {
      resolved.pose2 = msg.pose2;
    }
    else {
      resolved.pose2 = new Array(3).fill(0)
    }

    return resolved;
    }
};

module.exports = {
  Request: get_poseRequest,
  Response: get_poseResponse,
  md5sum() { return '2e9083aa4360091925401acb66844bd2'; },
  datatype() { return 'sr_pkg/get_pose'; }
};
