class Node(object):
    def __init__(self, value):
        self.value = value
        self.next = None

class SinglyLinkedList(object):
    def __init__(self):
        self.head = None
        self.tail = None

    def PrintAllVals(self):
        if not self.head:
            print "Empty!"
        else:
            runner = self.head
            while(runner.next != None):
                print runner.value
                runner = runner.next
            print runner.value

    def AddBack(self, val):
        newnode = Node(val)
        if not self.tail:
            self.head = newnode
            self.tail = newnode
        self.tail.next = newnode
        self.tail = newnode

    def AddFront(self, val):
        newnode = Node(val)
        if not self.head:
            self.head = newnode
            self.tail = newnode
        newnode.next = self.head
        self.head = newnode

    def InsertBefore(self, nextVal, val):
        newnode = Node(val)
        if not self.head:
            self.head = newnode
            self.tail = newnode
        else:
            runner = self.head
            if runner.value == nextVal:
                self.AddFront(val)
            while(runner.next != None):
                if runner.next.value == nextVal:
                    newnode.next = runner.next
                    runner.next = newnode
                    break
                runner = runner.next

    def InsertAfter(self, preval, val):
        newnode = Node(val)
        if not self.head:
            self.head = newnode
            self.tail = newnode
        else:
            runner = self.head
            while(runner.next != None):
                if runner.value == preval:
                    newnode.next = runner.next
                    runner.next = newnode
                    break
                runner = runner.next
            if runner.next == None:
                # Function is here only assuming that you want to insert the value if you don't find preval
                # if this function is not intended, then remove this if block
                runner.next = newnode

    def RemoveNode(self, val):
        if not self.head:
            print "Empty!"
        else:
            runner = self.head
            if runner.value == val:
                self.head = runner.next
            else:
                while(runner.next != None):
                    if runner.next.value == val:
                        runner.next = runner.next.next
                        break
                    runner = runner.next

    def ReverseList(self):
        newhead = self.tail
        newtail = self.tail
        while newtail != self.head:
            runner = self.head
            if runner.next == None:
                self.head = newhead
                break
            while runner.next != self.tail:
                runner = runner.next
            self.tail = runner
            newtail.next = runner
            newtail = newtail.next
            runner.next = None
        self.head = newhead

list = SinglyLinkedList()
list.AddBack('Alice')
list.AddBack('Ben')
list.AddBack('Chad')
list.AddBack('Debra')
list.AddBack('Eric')
list.AddBack('Fred')
# list.AddFront('Alice')
# list.InsertBefore('Debra', 'Jenn')
# list.InsertAfter('Jake', 'Jenny')
# list.RemoveNode('Alice')
list.PrintAllVals()
list.ReverseList()
list.PrintAllVals()
