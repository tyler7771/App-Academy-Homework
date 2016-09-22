class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue
  end
end

new_queue = Queue.new
p new_queue.show
p new_queue.enqueue(5)
p new_queue.enqueue(8)
p new_queue.enqueue(2)
p new_queue.enqueue(9)
p new_queue.enqueue(1)
p new_queue.show
p new_queue.dequeue
p new_queue.dequeue
p new_queue.show
