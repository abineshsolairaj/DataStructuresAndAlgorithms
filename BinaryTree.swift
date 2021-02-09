class Node {
    var value: Int
    var left: Node?
    var right: Node?

    init(value: Int){
        self.value = value
    }
}

class BinaryTree {
    
    var root: Node

    init(rootValue: Int){
        self.root = Node(value: rootValue)
    }

    func search(_ value: Int) -> Bool{
        return preorderSearch(start: root, value: value)
    }

    func preorderSearch(start: Node?, value: Int) -> Bool {
        if let start = start {
            if start.value == value {
                return true
            } else {
                return preorderSearch(start: start.left, value: value) || preorderSearch(start: start.right, value: value)
            }
        }
        return false
    }

    func printTree() {
        let result = preorderPrint(start: root, value: "")!
        print(String(result))
    }

    func preorderPrint(start: Node?, value: String) -> String? {
        var result = value
        if let start = start {
            result += "\(start.value), "
            if let leftValue = preorderPrint(start: start.left, value: result) {
                result = leftValue
            }
            if let rightValue = preorderPrint(start: start.right, value: result) {
                result = rightValue
            }
        }
        return result
    }
}


//Usage
let tree = BinaryTree(rootValue: 1)
tree.root.left = Node(value: 2)
tree.root.right = Node(value: 3)
tree.root.left?.left = Node(value: 4)
tree.root.left?.right = Node(value: 5)

// Test search
print(tree.search(4)) // Should be true
print(tree.search(6)) // Should be false

// Test printTree
print(tree.printTree())