class Node:
    def __init__(self, value):
        self.node_value = value
        self.next_node = None

    def value(self):
        return self.node_value

    def next(self):
        return self.next_node


class LinkedList:
    def __init__(self, values=None):
        if values is None:
            values = []

        self.size = 0
        self.list_head = None
        previous_node = None

        for value in values:
            node = Node(value)
            node.next_node = previous_node
            self.list_head = node
            previous_node = node
            self.size += 1

    def __len__(self):
        return self.size

    def __iter__(self):
        return self

    def __next__(self):
        if self.list_head is None:
            raise StopIteration

        value = self.list_head.node_value
        self.list_head = self.list_head.next_node
        return value


    def head(self):
        if not self.list_head:
            raise EmptyListException("The list is empty.")

        return self.list_head

    def push(self, value):
        old_head = self.list_head
        new_node = Node(value)
        new_node.next_node = old_head
        self.list_head = new_node
        self.size += 1

    def pop(self):
        current_head = self.head()
        new_head = current_head.next()
        self.size -= 1
        self.list_head = new_head
        return current_head.value()

    def reversed(self):
        reversed_iter = reversed(list(self))
        return reversed_iter






class EmptyListException(Exception):
    pass
