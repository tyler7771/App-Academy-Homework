class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack << el
  end

  def remove
    @stack.pop
  end

  def show
    @stack
  end
end

new_stack = Stack.new
p new_stack.show
p new_stack.add(5)
p new_stack.add(8)
p new_stack.add(2)
p new_stack.add(9)
p new_stack.add(1)
p new_stack.show
p new_stack.remove
p new_stack.show
