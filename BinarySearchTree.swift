
class Node {
    var value: Int
    var left: Node?
    var right: Node?

    init(value: Int) {
        self.value = value
    }
}

class BinarySearchTree {
    var root: Node

    init(value: Int) {
        self.root = Node(value: value)
    }

    func insert(_ value: Int) {
        insertHelper(current: root, value: value)
    }

    func insertHelper(current: Node?, value: Int) {
        if let current = current{
            if value < current.value {
                if let left = current.left {
                    insertHelper(current: left, value: value)
                } else {
                    current.left = Node(value: value)
                }
            } else {
                if let right = current.right {
                    insertHelper(current: right, value: value)
                } else {
                    current.right = Node(value: value)
                }
            }
        }
    }

    func search(_ value: Int) -> Bool {
        return searchHelper(current: root, value: value)
    }

    func searchHelper(current: Node?, value: Int) -> Bool {
        if let current = current {
            if value == current.value {
                return true
            } else if value < current.value {
                return searchHelper(current: current.left, value: value)
            } else {
                return searchHelper(current: current.right, value: value)
            }
        }
        return false
    }


}

//Usage
let tree = BinarySearchTree(value: 4)

// Insert elements
tree.insert(2)
tree.insert(1)
tree.insert(3)
tree.insert(5)

// Check search
print(tree.search(4)) // Should be true
print(tree.search(6))
