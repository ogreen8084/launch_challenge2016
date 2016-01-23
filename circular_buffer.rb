# circular buffer
class CircularBuffer
  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end

  def initialize(size)
    @loc = []
    @buffer_size = size
  end

  def write(val)
    fail BufferFullException if @loc.size + 1 > @buffer_size
    @loc.push(val) unless val.nil?
  end

  def read
    fail BufferEmptyException if @loc.size == 0
    @loc.shift
  end

  def clear
    @loc = []
  end

  def write!(val)
    return if val.nil?
    @loc.shift if @buffer_size < @loc.size + 1
    @loc.push(val)
  end
end
