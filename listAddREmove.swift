class ListItem {
  var name: String
  var price: Double
  var quantity: Int
  var next: ListItem?
  
  init(name: String, price: Double, quantity: Int) {
    self.name = name
    self.price = price
    self.quantity = quantity
    self.next = nil
  }
}
var head: ListItem?  

func inserElementList(name: String, price: Double, quantity: Int, position: Int) {
  
  let product = ListItem(name: name, price: price, quantity: quantity)

  if position == 1 {
    product.next = head
    head = product
  } else {
    var items = head
    var count = position
    
    while count > 2 {
      items = items?.next
      count -= 1
    }
      product.next = items?.next
      items?.next = product    
  } 
  
}

func addElementList() {
  print("\nEnter the name of the product: ", terminator: "")
  guard let Identity = readLine() else {
    print("The input is invalide")
    return
  }
  print("Enter the price of the product: ", terminator: "")
  guard let cost = readLine(), let doubleCost = Double(cost) else{
    print("The input is invalide")
    return
  }
  print("Enter the quntity of the product: ", terminator: "")
  guard let amount = readLine(), let intamount = Int(amount) else {
    print("The input is invalide")
    return
  }
  print("Enter the position of the product: ", terminator: "")
  guard let ubication = readLine(), let IntUbication = Int(ubication) else {
    print("the input is invalide")
    return
  }
  inserElementList(name: Identity, price: doubleCost, quantity: intamount, position: IntUbication)  
  showList()
}

func createList() {
  inserElementList(name: "banana", price: 3.45, quantity: 20, position: 1)
  inserElementList(name: "apple", price: 1.25, quantity: 15, position: 2)
  inserElementList(name: "orange", price: 2.00, quantity: 10, position: 3)
  showList()
}

func showList() {
  
  print("\nThe list:", terminator: "")
  
  var item = head
  var i = 1
  
  while item != nil {
    print("\n  product \(i): \(item?.name ?? "NA")" )
    print("     price:  \(item?.price ?? 0.0)" )
    print("     amount: \(item?.quantity ?? 0)" )
    item = item?.next
    i+=1
  } 
}

func deleElementList(){
  print("\nEnter the position of the product: ", terminator: "")
  guard let ubication = readLine(), let intUbication = Int(ubication) else {
    print("input error")
    return
  }
  if intUbication == 1 {
    head = head?.next
  } else {
    var item = head
    var index = intUbication
    
    while  index > 2 && item != nil {
      item = item?.next
      index -= 1 
    }
    guard let nextItem = item?.next else {
      print("the position is over the list")
      return
    }
    item?.next = nextItem.next
  }
  print("Elemente elimitado")
  showList()
}

createList()
addElementList()
deleElementList()





