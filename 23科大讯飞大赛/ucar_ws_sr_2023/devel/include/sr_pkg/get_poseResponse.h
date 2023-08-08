// Generated by gencpp from file sr_pkg/get_poseResponse.msg
// DO NOT EDIT!


#ifndef SR_PKG_MESSAGE_GET_POSERESPONSE_H
#define SR_PKG_MESSAGE_GET_POSERESPONSE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace sr_pkg
{
template <class ContainerAllocator>
struct get_poseResponse_
{
  typedef get_poseResponse_<ContainerAllocator> Type;

  get_poseResponse_()
    : count(0)
    , pose1()
    , pose2()  {
      pose1.assign(0.0);

      pose2.assign(0.0);
  }
  get_poseResponse_(const ContainerAllocator& _alloc)
    : count(0)
    , pose1()
    , pose2()  {
  (void)_alloc;
      pose1.assign(0.0);

      pose2.assign(0.0);
  }



   typedef uint8_t _count_type;
  _count_type count;

   typedef boost::array<float, 3>  _pose1_type;
  _pose1_type pose1;

   typedef boost::array<float, 3>  _pose2_type;
  _pose2_type pose2;





  typedef boost::shared_ptr< ::sr_pkg::get_poseResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::sr_pkg::get_poseResponse_<ContainerAllocator> const> ConstPtr;

}; // struct get_poseResponse_

typedef ::sr_pkg::get_poseResponse_<std::allocator<void> > get_poseResponse;

typedef boost::shared_ptr< ::sr_pkg::get_poseResponse > get_poseResponsePtr;
typedef boost::shared_ptr< ::sr_pkg::get_poseResponse const> get_poseResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::sr_pkg::get_poseResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::sr_pkg::get_poseResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::sr_pkg::get_poseResponse_<ContainerAllocator1> & lhs, const ::sr_pkg::get_poseResponse_<ContainerAllocator2> & rhs)
{
  return lhs.count == rhs.count &&
    lhs.pose1 == rhs.pose1 &&
    lhs.pose2 == rhs.pose2;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::sr_pkg::get_poseResponse_<ContainerAllocator1> & lhs, const ::sr_pkg::get_poseResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace sr_pkg

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::sr_pkg::get_poseResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::sr_pkg::get_poseResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::sr_pkg::get_poseResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::sr_pkg::get_poseResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::sr_pkg::get_poseResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::sr_pkg::get_poseResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::sr_pkg::get_poseResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "51b363c4cafc22f07a22924380562686";
  }

  static const char* value(const ::sr_pkg::get_poseResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x51b363c4cafc22f0ULL;
  static const uint64_t static_value2 = 0x7a22924380562686ULL;
};

template<class ContainerAllocator>
struct DataType< ::sr_pkg::get_poseResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "sr_pkg/get_poseResponse";
  }

  static const char* value(const ::sr_pkg::get_poseResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::sr_pkg::get_poseResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "uint8 count \n"
"float32[3] pose1\n"
"float32[3] pose2\n"
"\n"
;
  }

  static const char* value(const ::sr_pkg::get_poseResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::sr_pkg::get_poseResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.count);
      stream.next(m.pose1);
      stream.next(m.pose2);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct get_poseResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::sr_pkg::get_poseResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::sr_pkg::get_poseResponse_<ContainerAllocator>& v)
  {
    s << indent << "count: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.count);
    s << indent << "pose1[]" << std::endl;
    for (size_t i = 0; i < v.pose1.size(); ++i)
    {
      s << indent << "  pose1[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.pose1[i]);
    }
    s << indent << "pose2[]" << std::endl;
    for (size_t i = 0; i < v.pose2.size(); ++i)
    {
      s << indent << "  pose2[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.pose2[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // SR_PKG_MESSAGE_GET_POSERESPONSE_H
