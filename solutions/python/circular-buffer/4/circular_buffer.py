class BufferFullException(BufferError):
    """Exception raised when CircularBuffer is full.

    message: explanation of the error.

    """


class BufferEmptyException(BufferError):
    """Exception raised when CircularBuffer is empty.

    message: explanation of the error.

    """


class CircularBuffer:

    def __init__(self, capacity):
        self.capacity = capacity
        self.structure = [None] * capacity
        self.size = 0
        self.head = 0
        self.tail = 0

    def read(self):
        if self.size == 0:
            raise BufferEmptyException("Circular buffer is empty")

        self.tail = (self.tail + 1) % self.capacity
        self.size -= 1

        return self.structure[self.tail - 1]

    def write(self, data, rewrite=False):
        if self.size == self.capacity and not rewrite:
            raise BufferFullException("Circular buffer is full")

        self.structure[self.head] = data
        self.head = (self.head + 1) % self.capacity

        if rewrite:
            self.tail = (self.tail + 1) % self.capacity
        else:
            self.size += 1

    def overwrite(self, data):
        rewrite = self.size >= self.capacity
        self.write(data, rewrite)

    def clear(self):
        self.head = 0
        self.tail = 0
        self.size = 0
