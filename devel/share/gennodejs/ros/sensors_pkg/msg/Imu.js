// Auto-generated. Do not edit!

// (in-package sensors_pkg.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Imu {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.linearX = null;
      this.angularZ = null;
    }
    else {
      if (initObj.hasOwnProperty('linearX')) {
        this.linearX = initObj.linearX
      }
      else {
        this.linearX = 0.0;
      }
      if (initObj.hasOwnProperty('angularZ')) {
        this.angularZ = initObj.angularZ
      }
      else {
        this.angularZ = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Imu
    // Serialize message field [linearX]
    bufferOffset = _serializer.float32(obj.linearX, buffer, bufferOffset);
    // Serialize message field [angularZ]
    bufferOffset = _serializer.float32(obj.angularZ, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Imu
    let len;
    let data = new Imu(null);
    // Deserialize message field [linearX]
    data.linearX = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [angularZ]
    data.angularZ = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sensors_pkg/Imu';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '95d0b902c81b1f565dc6a9ceb49a25fb';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 linearX
    float32 angularZ
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Imu(null);
    if (msg.linearX !== undefined) {
      resolved.linearX = msg.linearX;
    }
    else {
      resolved.linearX = 0.0
    }

    if (msg.angularZ !== undefined) {
      resolved.angularZ = msg.angularZ;
    }
    else {
      resolved.angularZ = 0.0
    }

    return resolved;
    }
};

module.exports = Imu;
