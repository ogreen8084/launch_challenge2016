# circular buffer
class CircularBuffer
  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end

  def initialize(max)
    @buffer = []
    @buffer_max = max
  end

  def write(val)
    fail BufferFullException if @buffer.size + 1 > @buffer_max
    @buffer.push(val) unless val.nil?
  end

  def read
    fail BufferEmptyException if @buffer.empty?
    @buffer.shift
  end

  def clear
    @buffer = []
  end

  def write!(val)
    return if val.nil?
    @buffer.shift if @buffer_max < @buffer.size + 1
    @buffer.push(val)
  end
end
