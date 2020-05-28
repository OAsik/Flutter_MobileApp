import "package:uuid/uuid.dart";
import "../models/userOder.dart";
import "../models/appException.dart";
import "package:flutter/foundation.dart";
import "../helpers/constants/errorMessage.dart";

class UserOrderProvider with ChangeNotifier {
  List<UserOrder> _dummyList = [
    UserOrder(
      id: "a2917a00-1ecb-4698-9c0d-d50af3df4b01",
      userId: "af5b63af-2923-438e-a4ec-43f5e0acf06d",
      productId: "1498dbc2-481b-462a-9255-ff97bb29f925",
      subProductDetailId: "",
      orderDate: DateTime.parse("2020-05-20 00:00:00"),
      isCheckedOut: false,
      productQuantity: 2,
      total: 4
    ),
    UserOrder(
      id: "340dcbb7-f720-4aed-a85f-7b9c1a517b69",
      userId: "af5b63af-2923-438e-a4ec-43f5e0acf06d",
      productId: "640d3d67-f631-4ebb-8e83-e156a7acd035",
      subProductDetailId: "",
      orderDate: DateTime.parse("2020-05-20 00:00:00"),
      isCheckedOut: false,
      productQuantity: 1,
      total: 5
    ),
    UserOrder(
      id: "96e8763e-b93c-4d36-9e1c-ecd9b7eebec0",
      userId: "af5b63af-2923-438e-a4ec-43f5e0acf06d",
      productId: "",
      subProductDetailId: "4b46dfd2-bd5a-4d82-a023-a734e562fa99",
      orderDate: DateTime.parse("2020-05-20 00:00:00"),
      isCheckedOut: false,
      productQuantity: 3,
      total: 60.48
    )
  ];

  List<UserOrder> get allUserOrders {
    return [..._dummyList];
  }

  List<UserOrder> getUserOrders(String userId) {
    try
    {
      return _dummyList.where((userOrder) => userOrder.userId == userId).toList();
    }
    catch(_)
    {
      throw AppException(ErrorMessages.userNotCreated); 
    }
  }

  double getUserOrderTotal(String userId) {
    double grandTotal = 0;

    _dummyList.where((userOder) => userOder.userId == userId).forEach((userOrderData) => {
      grandTotal += userOrderData.total
    });

    //Flutter throws "setState() or markNeedsBuild() called during build" error on here IF notifyListeners is called below. The reason is, setState cannot be called during the widget (in this case userOrderScreen) build time, and notifyListeners calls setState. Additionally, we are already calling notifyListeners on updating a userOrder (check below method) which also implicitly updates this method, and Consumer widget always listens for the changes in the data. Thus, its also redundant to call below notifyListeners --Özgür
    //notifyListeners();

    return grandTotal;
  }

  void updateUserOrder(String id, UserOrder updatedUserOrder) {
    final orderIndex = _dummyList.indexWhere((product) => product.id == id);

    _dummyList[orderIndex] = updatedUserOrder;

    notifyListeners();
  }

  void deleteUserOrder(String id) {
    final orderIndex = _dummyList.indexWhere((userOrder) => userOrder.id == id);

    _dummyList.removeAt(orderIndex);

    notifyListeners();
  }

  void deleteSingleUserOrder(String userId, String productId, String subProductDetailId, double unitPrice) {
    List<UserOrder> userOrderList = _dummyList.where((userOrder) => userOrder.userId == userId).toList();

    UserOrder userOrderToBeDeleted = userOrderList.firstWhere((userOrder) => productId == "" ? userOrder.subProductDetailId == subProductDetailId : userOrder.productId == productId, orElse: () => null);

    if (userOrderToBeDeleted != null) {
      int quantity = userOrderToBeDeleted.productQuantity;
      int orderIndex = _dummyList.indexWhere((userOrder) => userOrder.id == userOrderToBeDeleted.id);

      if (quantity > 1) {
        quantity -= 1;

        userOrderToBeDeleted.productQuantity = quantity;
        userOrderToBeDeleted.total -= unitPrice;

        _dummyList[orderIndex] = userOrderToBeDeleted;

        notifyListeners();
      }
      else if (quantity == 1) {
        _dummyList.removeAt(orderIndex);

        notifyListeners();
      }
      else {
        throw AppException(ErrorMessages.userNotCreated); //fix error message - product does not exists in the cart
      }
    }
    else {
      throw AppException(ErrorMessages.userNotCreated);
    }
  }

  void _addingNewItem(String userId, String productId, String subProductDetailId, double unitPrice) {
    Uuid uuid = Uuid();

    UserOrder newUserOrder = UserOrder(
      id: uuid.v4(),
      userId: userId,
      productId: subProductDetailId != "" ? "" : productId,
      subProductDetailId: productId != "" ? "" : subProductDetailId,
      orderDate: DateTime.now(),
      isCheckedOut: false,
      productQuantity: 1,
      total: unitPrice
    );

    _dummyList.add(newUserOrder);
  }

  void createUserOrder(String userId, String productId, String subProductDetailId, double unitPrice) {
    try
    {
      if (_dummyList.where((userOrder) => userOrder.userId== userId).toList().length == 0) {
        _addingNewItem(userId, productId, subProductDetailId, unitPrice);
      }
      else {
        List<UserOrder> userOrderList = _dummyList.where((userOrder) => userOrder.userId == userId).toList();

        UserOrder existingUserOrder = userOrderList.firstWhere((userOrder) => productId == "" ? userOrder.subProductDetailId == subProductDetailId : userOrder.productId == productId, orElse: () => null);

        if (existingUserOrder != null) {
          int orderIndex = _dummyList.indexWhere((userOrder) => userOrder.id == existingUserOrder.id);

          existingUserOrder.productQuantity += 1;
          existingUserOrder.total += unitPrice;

          _dummyList[orderIndex] = existingUserOrder;
        }
        else {
          _addingNewItem(userId, productId, subProductDetailId, unitPrice);
        }        
      }

      notifyListeners();
    }
    catch(_)
    {
      throw AppException(ErrorMessages.userNotCreated);
    }
  }
}