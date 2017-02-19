class Node(object):
    def __init__(self, value):
        self.value = value
        self.prev = None
        self.next = None

class DoublyLinkedList(object):
    def __init__(self):
        self.head = None
        self.tail = None

    def PrintList(self):
        runner = self.head
        if not runner:
            print "Empty!"
        else:
            while runner.next != None:
                print runner.value
                runner = runner.next
            print runner.value

    def AddEnd(self, val):
        newnode = Node(val)
        if self.head == None or self.tail == None:
            self.head = newnode
            self.tail = newnode
        else:
            runner = self.head
            while runner.next != None:
                runner = runner.next
            runner.next = newnode
            newnode.prev = runner
            self.tail = newnode

    def Delete(self, value):
        runner = self.head
        if not runner:
            print "Empty"
        else:
            if self.head.value == value:
                self.head.prev = None
                self.head = self.head.next
            elif self.tail.value == value:
                self.tail.prev.next = None
                self.tail = self.tail.prev
            else:
                while runner.next != None:
                    if runner.value == value:
                        runner.prev.next = runner.next
                        runner.next.prev = runner.prev
                    runner = runner.next

    def InsertBefore(self, nextVal, val):
        newnode = Node(val)
        if self.head.value == nextVal:
            newnode.next = self.head
            self.head.prev = newnode
            self.head = newnode
        else:
            runner = self.head
            while runner.next.value != nextVal and runner.next != None:
                runner = runner.next
            runner.next.prev = newnode
            newnode.prev = runner
            runner.next = newnode

list = DoublyLinkedList()
list.AddEnd("Alice")
list.AddEnd("Ben")
list.AddEnd("Chad")
list.AddEnd("Debra")
list.AddEnd("Eric")
list.AddEnd("Frank")
# list.PrintList()
# list.Delete("Alice")
# list.PrintList()
print "Insert:"
list.InsertBefore("Chad", "Bob")
list.PrintList()
