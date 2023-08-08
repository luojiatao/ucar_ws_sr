// Auto-generated. Do not edit!

// (in-package darknet_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class darknet2 {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.cuf1 = null;
      this.cuf2 = null;
      this.cuf3 = null;
      this.cof1 = null;
      this.cof2 = null;
      this.waf = null;
      this.cuv = null;
      this.riv = null;
      this.whv = null;
      this.cov = null;
    }
    else {
      if (initObj.hasOwnProperty('cuf1')) {
        this.cuf1 = initObj.cuf1
      }
      else {
        this.cuf1 = 0;
      }
      if (initObj.hasOwnProperty('cuf2')) {
        this.cuf2 = initObj.cuf2
      }
      else {
        this.cuf2 = 0;
      }
      if (initObj.hasOwnProperty('cuf3')) {
        this.cuf3 = initObj.cuf3
      }
      else {
        this.cuf3 = 0;
      }
      if (initObj.hasOwnProperty('cof1')) {
        this.cof1 = initObj.cof1
      }
      else {
        this.cof1 = 0;
      }
      if (initObj.hasOwnProperty('cof2')) {
        this.cof2 = initObj.cof2
      }
      else {
        this.cof2 = 0;
      }
      if (initObj.hasOwnProperty('waf')) {
        this.waf = initObj.waf
      }
      else {
        this.waf = 0;
      }
      if (initObj.hasOwnProperty('cuv')) {
        this.cuv = initObj.cuv
      }
      else {
        this.cuv = 0;
      }
      if (initObj.hasOwnProperty('riv')) {
        this.riv = initObj.riv
      }
      else {
        this.riv = 0;
      }
      if (initObj.hasOwnProperty('whv')) {
        this.whv = initObj.whv
      }
      else {
        this.whv = 0;
      }
      if (initObj.hasOwnProperty('cov')) {
        this.cov = initObj.cov
      }
      else {
        this.cov = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type darknet2
    // Serialize message field [cuf1]
    bufferOffset = _serializer.int8(obj.cuf1, buffer, bufferOffset);
    // Serialize message field [cuf2]
    bufferOffset = _serializer.int8(obj.cuf2, buffer, bufferOffset);
    // Serialize message field [cuf3]
    bufferOffset = _serializer.int8(obj.cuf3, buffer, bufferOffset);
    // Serialize message field [cof1]
    bufferOffset = _serializer.int8(obj.cof1, buffer, bufferOffset);
    // Serialize message field [cof2]
    bufferOffset = _serializer.int8(obj.cof2, buffer, bufferOffset);
    // Serialize message field [waf]
    bufferOffset = _serializer.int8(obj.waf, buffer, bufferOffset);
    // Serialize message field [cuv]
    bufferOffset = _serializer.int8(obj.cuv, buffer, bufferOffset);
    // Serialize message field [riv]
    bufferOffset = _serializer.int8(obj.riv, buffer, bufferOffset);
    // Serialize message field [whv]
    bufferOffset = _serializer.int8(obj.whv, buffer, bufferOffset);
    // Serialize message field [cov]
    bufferOffset = _serializer.int8(obj.cov, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type darknet2
    let len;
    let data = new darknet2(null);
    // Deserialize message field [cuf1]
    data.cuf1 = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [cuf2]
    data.cuf2 = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [cuf3]
    data.cuf3 = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [cof1]
    data.cof1 = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [cof2]
    data.cof2 = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [waf]
    data.waf = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [cuv]
    data.cuv = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [riv]
    data.riv = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [whv]
    data.whv = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [cov]
    data.cov = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 10;
  }

  static datatype() {
    // Returns string type for a message object
    return 'darknet_msgs/darknet2';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '926901501b0964cda8759316557a1042';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int8 cuf1
    int8 cuf2
    int8 cuf3
    int8 cof1
    int8 cof2
    int8 waf
    int8 cuv
    int8 riv
    int8 whv
    int8 cov
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new darknet2(null);
    if (msg.cuf1 !== undefined) {
      resolved.cuf1 = msg.cuf1;
    }
    else {
      resolved.cuf1 = 0
    }

    if (msg.cuf2 !== undefined) {
      resolved.cuf2 = msg.cuf2;
    }
    else {
      resolved.cuf2 = 0
    }

    if (msg.cuf3 !== undefined) {
      resolved.cuf3 = msg.cuf3;
    }
    else {
      resolved.cuf3 = 0
    }

    if (msg.cof1 !== undefined) {
      resolved.cof1 = msg.cof1;
    }
    else {
      resolved.cof1 = 0
    }

    if (msg.cof2 !== undefined) {
      resolved.cof2 = msg.cof2;
    }
    else {
      resolved.cof2 = 0
    }

    if (msg.waf !== undefined) {
      resolved.waf = msg.waf;
    }
    else {
      resolved.waf = 0
    }

    if (msg.cuv !== undefined) {
      resolved.cuv = msg.cuv;
    }
    else {
      resolved.cuv = 0
    }

    if (msg.riv !== undefined) {
      resolved.riv = msg.riv;
    }
    else {
      resolved.riv = 0
    }

    if (msg.whv !== undefined) {
      resolved.whv = msg.whv;
    }
    else {
      resolved.whv = 0
    }

    if (msg.cov !== undefined) {
      resolved.cov = msg.cov;
    }
    else {
      resolved.cov = 0
    }

    return resolved;
    }
};

module.exports = darknet2;
