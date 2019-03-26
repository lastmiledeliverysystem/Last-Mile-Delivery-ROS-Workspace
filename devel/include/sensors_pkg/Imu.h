// Generated by gencpp from file sensors_pkg/Imu.msg
// DO NOT EDIT!


#ifndef SENSORS_PKG_MESSAGE_IMU_H
#define SENSORS_PKG_MESSAGE_IMU_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>

namespace sensors_pkg
{
template <class ContainerAllocator>
struct Imu_
{
  typedef Imu_<ContainerAllocator> Type;

  Imu_()
    : header()
    , linearX(0.0)
    , angularZ(0.0)  {
    }
  Imu_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , linearX(0.0)
    , angularZ(0.0)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef float _linearX_type;
  _linearX_type linearX;

   typedef float _angularZ_type;
  _angularZ_type angularZ;





  typedef boost::shared_ptr< ::sensors_pkg::Imu_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::sensors_pkg::Imu_<ContainerAllocator> const> ConstPtr;

}; // struct Imu_

typedef ::sensors_pkg::Imu_<std::allocator<void> > Imu;

typedef boost::shared_ptr< ::sensors_pkg::Imu > ImuPtr;
typedef boost::shared_ptr< ::sensors_pkg::Imu const> ImuConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::sensors_pkg::Imu_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::sensors_pkg::Imu_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace sensors_pkg

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': True}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'sensors_pkg': ['/home/pi/catkin_gp/src/sensors_pkg/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::sensors_pkg::Imu_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::sensors_pkg::Imu_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::sensors_pkg::Imu_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::sensors_pkg::Imu_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::sensors_pkg::Imu_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::sensors_pkg::Imu_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::sensors_pkg::Imu_<ContainerAllocator> >
{
  static const char* value()
  {
    return "28ac01ad4f2b4bb4075e47575365d707";
  }

  static const char* value(const ::sensors_pkg::Imu_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x28ac01ad4f2b4bb4ULL;
  static const uint64_t static_value2 = 0x075e47575365d707ULL;
};

template<class ContainerAllocator>
struct DataType< ::sensors_pkg::Imu_<ContainerAllocator> >
{
  static const char* value()
  {
    return "sensors_pkg/Imu";
  }

  static const char* value(const ::sensors_pkg::Imu_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::sensors_pkg::Imu_<ContainerAllocator> >
{
  static const char* value()
  {
    return "std_msgs/Header header\n\
float32 linearX\n\
float32 angularZ\n\
\n\
================================================================================\n\
MSG: std_msgs/Header\n\
# Standard metadata for higher-level stamped data types.\n\
# This is generally used to communicate timestamped data \n\
# in a particular coordinate frame.\n\
# \n\
# sequence ID: consecutively increasing ID \n\
uint32 seq\n\
#Two-integer timestamp that is expressed as:\n\
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n\
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n\
# time-handling sugar is provided by the client library\n\
time stamp\n\
#Frame this data is associated with\n\
# 0: no frame\n\
# 1: global frame\n\
string frame_id\n\
";
  }

  static const char* value(const ::sensors_pkg::Imu_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::sensors_pkg::Imu_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.linearX);
      stream.next(m.angularZ);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Imu_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::sensors_pkg::Imu_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::sensors_pkg::Imu_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "linearX: ";
    Printer<float>::stream(s, indent + "  ", v.linearX);
    s << indent << "angularZ: ";
    Printer<float>::stream(s, indent + "  ", v.angularZ);
  }
};

} // namespace message_operations
} // namespace ros

#endif // SENSORS_PKG_MESSAGE_IMU_H
