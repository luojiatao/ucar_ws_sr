# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from darknet_msgs/darknet2.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class darknet2(genpy.Message):
  _md5sum = "926901501b0964cda8759316557a1042"
  _type = "darknet_msgs/darknet2"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """int8 cuf1
int8 cuf2
int8 cuf3
int8 cof1
int8 cof2
int8 waf
int8 cuv
int8 riv
int8 whv
int8 cov

"""
  __slots__ = ['cuf1','cuf2','cuf3','cof1','cof2','waf','cuv','riv','whv','cov']
  _slot_types = ['int8','int8','int8','int8','int8','int8','int8','int8','int8','int8']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       cuf1,cuf2,cuf3,cof1,cof2,waf,cuv,riv,whv,cov

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(darknet2, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.cuf1 is None:
        self.cuf1 = 0
      if self.cuf2 is None:
        self.cuf2 = 0
      if self.cuf3 is None:
        self.cuf3 = 0
      if self.cof1 is None:
        self.cof1 = 0
      if self.cof2 is None:
        self.cof2 = 0
      if self.waf is None:
        self.waf = 0
      if self.cuv is None:
        self.cuv = 0
      if self.riv is None:
        self.riv = 0
      if self.whv is None:
        self.whv = 0
      if self.cov is None:
        self.cov = 0
    else:
      self.cuf1 = 0
      self.cuf2 = 0
      self.cuf3 = 0
      self.cof1 = 0
      self.cof2 = 0
      self.waf = 0
      self.cuv = 0
      self.riv = 0
      self.whv = 0
      self.cov = 0

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_10b().pack(_x.cuf1, _x.cuf2, _x.cuf3, _x.cof1, _x.cof2, _x.waf, _x.cuv, _x.riv, _x.whv, _x.cov))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 10
      (_x.cuf1, _x.cuf2, _x.cuf3, _x.cof1, _x.cof2, _x.waf, _x.cuv, _x.riv, _x.whv, _x.cov,) = _get_struct_10b().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_10b().pack(_x.cuf1, _x.cuf2, _x.cuf3, _x.cof1, _x.cof2, _x.waf, _x.cuv, _x.riv, _x.whv, _x.cov))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 10
      (_x.cuf1, _x.cuf2, _x.cuf3, _x.cof1, _x.cof2, _x.waf, _x.cuv, _x.riv, _x.whv, _x.cov,) = _get_struct_10b().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_10b = None
def _get_struct_10b():
    global _struct_10b
    if _struct_10b is None:
        _struct_10b = struct.Struct("<10b")
    return _struct_10b
