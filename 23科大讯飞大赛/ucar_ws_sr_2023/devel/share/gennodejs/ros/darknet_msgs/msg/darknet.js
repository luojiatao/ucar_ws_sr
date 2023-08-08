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

class darknet {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.E_cuv = null;
      this.E_riv = null;
      this.E_whv = null;
      this.E_cov = null;
      this.D_cuv = null;
      this.D_riv = null;
      this.D_whv = null;
      this.D_cov = null;
      this.C_cuv = null;
      this.C_riv = null;
      this.C_whv = null;
      this.C_cov = null;
      this.B_cuv = null;
      this.B_riv = null;
      this.B_whv = null;
      this.B_cov = null;
      this.F_cuf = null;
      this.F_cof = null;
      this.F_waf = null;
    }
    else {
      if (initObj.hasOwnProperty('E_cuv')) {
        this.E_cuv = initObj.E_cuv
      }
      else {
        this.E_cuv = 0;
      }
      if (initObj.hasOwnProperty('E_riv')) {
        this.E_riv = initObj.E_riv
      }
      else {
        this.E_riv = 0;
      }
      if (initObj.hasOwnProperty('E_whv')) {
        this.E_whv = initObj.E_whv
      }
      else {
        this.E_whv = 0;
      }
      if (initObj.hasOwnProperty('E_cov')) {
        this.E_cov = initObj.E_cov
      }
      else {
        this.E_cov = 0;
      }
      if (initObj.hasOwnProperty('D_cuv')) {
        this.D_cuv = initObj.D_cuv
      }
      else {
        this.D_cuv = 0;
      }
      if (initObj.hasOwnProperty('D_riv')) {
        this.D_riv = initObj.D_riv
      }
      else {
        this.D_riv = 0;
      }
      if (initObj.hasOwnProperty('D_whv')) {
        this.D_whv = initObj.D_whv
      }
      else {
        this.D_whv = 0;
      }
      if (initObj.hasOwnProperty('D_cov')) {
        this.D_cov = initObj.D_cov
      }
      else {
        this.D_cov = 0;
      }
      if (initObj.hasOwnProperty('C_cuv')) {
        this.C_cuv = initObj.C_cuv
      }
      else {
        this.C_cuv = 0;
      }
      if (initObj.hasOwnProperty('C_riv')) {
        this.C_riv = initObj.C_riv
      }
      else {
        this.C_riv = 0;
      }
      if (initObj.hasOwnProperty('C_whv')) {
        this.C_whv = initObj.C_whv
      }
      else {
        this.C_whv = 0;
      }
      if (initObj.hasOwnProperty('C_cov')) {
        this.C_cov = initObj.C_cov
      }
      else {
        this.C_cov = 0;
      }
      if (initObj.hasOwnProperty('B_cuv')) {
        this.B_cuv = initObj.B_cuv
      }
      else {
        this.B_cuv = 0;
      }
      if (initObj.hasOwnProperty('B_riv')) {
        this.B_riv = initObj.B_riv
      }
      else {
        this.B_riv = 0;
      }
      if (initObj.hasOwnProperty('B_whv')) {
        this.B_whv = initObj.B_whv
      }
      else {
        this.B_whv = 0;
      }
      if (initObj.hasOwnProperty('B_cov')) {
        this.B_cov = initObj.B_cov
      }
      else {
        this.B_cov = 0;
      }
      if (initObj.hasOwnProperty('F_cuf')) {
        this.F_cuf = initObj.F_cuf
      }
      else {
        this.F_cuf = 0;
      }
      if (initObj.hasOwnProperty('F_cof')) {
        this.F_cof = initObj.F_cof
      }
      else {
        this.F_cof = 0;
      }
      if (initObj.hasOwnProperty('F_waf')) {
        this.F_waf = initObj.F_waf
      }
      else {
        this.F_waf = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type darknet
    // Serialize message field [E_cuv]
    bufferOffset = _serializer.int8(obj.E_cuv, buffer, bufferOffset);
    // Serialize message field [E_riv]
    bufferOffset = _serializer.int8(obj.E_riv, buffer, bufferOffset);
    // Serialize message field [E_whv]
    bufferOffset = _serializer.int8(obj.E_whv, buffer, bufferOffset);
    // Serialize message field [E_cov]
    bufferOffset = _serializer.int8(obj.E_cov, buffer, bufferOffset);
    // Serialize message field [D_cuv]
    bufferOffset = _serializer.int8(obj.D_cuv, buffer, bufferOffset);
    // Serialize message field [D_riv]
    bufferOffset = _serializer.int8(obj.D_riv, buffer, bufferOffset);
    // Serialize message field [D_whv]
    bufferOffset = _serializer.int8(obj.D_whv, buffer, bufferOffset);
    // Serialize message field [D_cov]
    bufferOffset = _serializer.int8(obj.D_cov, buffer, bufferOffset);
    // Serialize message field [C_cuv]
    bufferOffset = _serializer.int8(obj.C_cuv, buffer, bufferOffset);
    // Serialize message field [C_riv]
    bufferOffset = _serializer.int8(obj.C_riv, buffer, bufferOffset);
    // Serialize message field [C_whv]
    bufferOffset = _serializer.int8(obj.C_whv, buffer, bufferOffset);
    // Serialize message field [C_cov]
    bufferOffset = _serializer.int8(obj.C_cov, buffer, bufferOffset);
    // Serialize message field [B_cuv]
    bufferOffset = _serializer.int8(obj.B_cuv, buffer, bufferOffset);
    // Serialize message field [B_riv]
    bufferOffset = _serializer.int8(obj.B_riv, buffer, bufferOffset);
    // Serialize message field [B_whv]
    bufferOffset = _serializer.int8(obj.B_whv, buffer, bufferOffset);
    // Serialize message field [B_cov]
    bufferOffset = _serializer.int8(obj.B_cov, buffer, bufferOffset);
    // Serialize message field [F_cuf]
    bufferOffset = _serializer.int8(obj.F_cuf, buffer, bufferOffset);
    // Serialize message field [F_cof]
    bufferOffset = _serializer.int8(obj.F_cof, buffer, bufferOffset);
    // Serialize message field [F_waf]
    bufferOffset = _serializer.int8(obj.F_waf, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type darknet
    let len;
    let data = new darknet(null);
    // Deserialize message field [E_cuv]
    data.E_cuv = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [E_riv]
    data.E_riv = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [E_whv]
    data.E_whv = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [E_cov]
    data.E_cov = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [D_cuv]
    data.D_cuv = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [D_riv]
    data.D_riv = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [D_whv]
    data.D_whv = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [D_cov]
    data.D_cov = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [C_cuv]
    data.C_cuv = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [C_riv]
    data.C_riv = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [C_whv]
    data.C_whv = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [C_cov]
    data.C_cov = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [B_cuv]
    data.B_cuv = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [B_riv]
    data.B_riv = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [B_whv]
    data.B_whv = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [B_cov]
    data.B_cov = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [F_cuf]
    data.F_cuf = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [F_cof]
    data.F_cof = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [F_waf]
    data.F_waf = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 19;
  }

  static datatype() {
    // Returns string type for a message object
    return 'darknet_msgs/darknet';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '96d5d6b2bcac656db2c131f986f9c0bb';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int8 E_cuv
    int8 E_riv
    int8 E_whv
    int8 E_cov
    
    int8 D_cuv
    int8 D_riv
    int8 D_whv
    int8 D_cov
    
    int8 C_cuv
    int8 C_riv
    int8 C_whv
    int8 C_cov
    
    int8 B_cuv
    int8 B_riv
    int8 B_whv
    int8 B_cov
    
    int8 F_cuf
    int8 F_cof
    int8 F_waf
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new darknet(null);
    if (msg.E_cuv !== undefined) {
      resolved.E_cuv = msg.E_cuv;
    }
    else {
      resolved.E_cuv = 0
    }

    if (msg.E_riv !== undefined) {
      resolved.E_riv = msg.E_riv;
    }
    else {
      resolved.E_riv = 0
    }

    if (msg.E_whv !== undefined) {
      resolved.E_whv = msg.E_whv;
    }
    else {
      resolved.E_whv = 0
    }

    if (msg.E_cov !== undefined) {
      resolved.E_cov = msg.E_cov;
    }
    else {
      resolved.E_cov = 0
    }

    if (msg.D_cuv !== undefined) {
      resolved.D_cuv = msg.D_cuv;
    }
    else {
      resolved.D_cuv = 0
    }

    if (msg.D_riv !== undefined) {
      resolved.D_riv = msg.D_riv;
    }
    else {
      resolved.D_riv = 0
    }

    if (msg.D_whv !== undefined) {
      resolved.D_whv = msg.D_whv;
    }
    else {
      resolved.D_whv = 0
    }

    if (msg.D_cov !== undefined) {
      resolved.D_cov = msg.D_cov;
    }
    else {
      resolved.D_cov = 0
    }

    if (msg.C_cuv !== undefined) {
      resolved.C_cuv = msg.C_cuv;
    }
    else {
      resolved.C_cuv = 0
    }

    if (msg.C_riv !== undefined) {
      resolved.C_riv = msg.C_riv;
    }
    else {
      resolved.C_riv = 0
    }

    if (msg.C_whv !== undefined) {
      resolved.C_whv = msg.C_whv;
    }
    else {
      resolved.C_whv = 0
    }

    if (msg.C_cov !== undefined) {
      resolved.C_cov = msg.C_cov;
    }
    else {
      resolved.C_cov = 0
    }

    if (msg.B_cuv !== undefined) {
      resolved.B_cuv = msg.B_cuv;
    }
    else {
      resolved.B_cuv = 0
    }

    if (msg.B_riv !== undefined) {
      resolved.B_riv = msg.B_riv;
    }
    else {
      resolved.B_riv = 0
    }

    if (msg.B_whv !== undefined) {
      resolved.B_whv = msg.B_whv;
    }
    else {
      resolved.B_whv = 0
    }

    if (msg.B_cov !== undefined) {
      resolved.B_cov = msg.B_cov;
    }
    else {
      resolved.B_cov = 0
    }

    if (msg.F_cuf !== undefined) {
      resolved.F_cuf = msg.F_cuf;
    }
    else {
      resolved.F_cuf = 0
    }

    if (msg.F_cof !== undefined) {
      resolved.F_cof = msg.F_cof;
    }
    else {
      resolved.F_cof = 0
    }

    if (msg.F_waf !== undefined) {
      resolved.F_waf = msg.F_waf;
    }
    else {
      resolved.F_waf = 0
    }

    return resolved;
    }
};

module.exports = darknet;
