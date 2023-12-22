const app = angular.module("cart-app", []);

app.controller("cart-controller", function ($scope, $http) {
    $scope.cart = {
        items: [],
        add(id) {
            let item = this.items.find(item => item.id == id);
            if (item) {
                item.quantity++;
            } else {
                $http.get(`/rest/cameras/${id}`).then(resp => {
                    resp.data.quantity = 1;
                    this.items.push(resp.data);
                })
            }
            this.saveToLocalStorage();
        },
        get count() {
            return this.items.length;
        },
        get totalCart() {
            return this.items.reduce((total, item) => total + (item.quantity * item.price), 0);
        },
        checkQuantity(item) {
            if (item.quantity === 0) {
                this.remove(item.id);
            } else {
                this.saveToLocalStorage();
            }
        },
        remove(id) {
            const index = this.items.findIndex(item => item.id == id);
            this.items.splice(index, 1);
            this.saveToLocalStorage();
        },
        removeCart() {
            this.items = [];
            localStorage.removeItem("cart");
        },
        saveToLocalStorage() {
            localStorage.setItem("cart", JSON.stringify(this.items));
        },
        loadFromLocalStorage() {
            this.items = JSON.parse(localStorage.getItem("cart")) || [];
        }
    };
    $scope.cart.loadFromLocalStorage();

    /*$scope.order = {
        account: {},
        orderDate: new Date(),
        totalOrderAmount: 0, // Khởi tạo totalOrderAmount ban đầu là 0
        paymentMethod: false,
        province: '', // Khai báo và gán giá trị ban đầu cho các trường thông tin
        district: '',
        ward: '',
        specificAddress: '',
        email: '',
        firstname: '',
        lastname: '',
        phone: '',
        get orderDetails() {
            return $scope.cart.items.map(item => {
                return {
                    camera: { id: item.id },
                    price: item.price,
                    quantity: item.quantity
                }
            })
        },
        submitOrder() {
            this.totalOrderAmount = $scope.cart.totalCart; // Cập nhật totalOrderAmount khi submit đơn hàng
            var order = angular.copy(this);
            $http.post("/rest/oders", order).then(resp => {
                alert("Đặt hàng thành công !");
            }).catch(error => {
                alert("Đặt hàng không thành công !");
                console.log(error);
            })
        },
        updatePaymentMethod(method) {
            this.paymentMethod = method === 'paypal'; // Gán giá trị true nếu chọn 'paypal', ngược lại là false
        }
    };*/
});


