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

class Gps {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.long = null;
      this.lat = null;
    }
    else {
      if (initObj.hasOwnProperty('long')) {
        this.long = initObj.long
      }
      else {
        this.long = 0.0;
      }
      if (initObj.hasOwnProperty('lat')) {
        this.lat = initObj.lat
      }
      else {
        this.lat = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Gps
    // Serialize message field [long]
    bufferOffset = _serializer.float32(obj.long, buffer, bufferOffset);
    // Serialize message field [lat]
    bufferOffset = _serializer.float32(obj.lat, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Gps
    let len;
    let data = new Gps(null);
    // Deserialize message field [long]
    data.long = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [lat]
    data.lat = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sensors_pkg/Gps';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7abaaee080310abc2b3b4a45bd04059e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 long
    float32 lat
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Gps(null);
    if (msg.long !== undefined) {
      resolved.long = msg.long;
    }
    else {
      resolved.long = 0.0
    }

    if (msg.lat !== undefined) {
      resolved.lat = msg.lat;
    }
    else {
      resolved.lat = 0.0
    }

    return resolved;
    }
};

module.exports = Gps;
