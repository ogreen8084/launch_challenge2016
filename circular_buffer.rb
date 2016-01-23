# circular buffer
class CircularBuffer
  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end

  def initialize(size)
    @buffer = []
    @buffer_size = size
  end

  def write(val)
    fail BufferFullException if @buffer.size + 1 > @buffer_size
    @buffer.push(val) unless val.nil?
  end

  def read
    fail BufferEmptyException if @buffer.size == 0
    @buffer.shift
  end

  def clear
    @buffer = []
  end

  def write!(val)
    return if val.nil?
    @buffer.shift if @buffer_size < @buffer.size + 1
    @buffer.push(val)
  end
end
