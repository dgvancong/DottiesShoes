var app = angular.module('AppBanHang', []);
app.controller("CheckoutCtrl", function ($scope, $http, $window) {
    let objectjson_customer= {};
    let cart = [];
    let listjson_detail =[];
    let CTDonHang = {};
    let DonHang = {};

    $scope.Checkout = function(){

        objectjson_customer.hoTen = $scope.tenkh;
        objectjson_customer.soDT = $scope.sdtkh;
        objectjson_customer.diaChi = $scope.diachikh;

        DonHang.trangThaiDonHang = $scope.trangthaikh;
        DonHang.hoTen = $scope.tenkh;
        DonHang.soDT = $scope.sdtkh;
        DonHang.diaChi = $scope.diachikh;
        DonHang.ghiChu = 'Chờ xác nhận';
        
        $scope.myData = $window.localStorage.getItem('cart');
        cart = JSON.parse($scope.myData);
        var totalPay = 0;

        for(var i=0; i<cart.length; i++){
            totalPay += cart[i].quantity *  cart[i].donGia;
            CTDonHang.donGia = totalPay;
        }

        CTDonHang = totalPay;
        DonHang.objectjson_customer = objectjson_customer;
        DonHang.listjson_detail = cart;

        $http.post(thanhtoans_url + '/api/DonHang/create_donhang', DonHang).then(function (response) {
            $window.localStorage.removeItem('cart');
            $window.location.href = 'index.html';
            makeScript('js/main.js')
        }, function (error) {
            console.log(error)
            alert("Thanh toán không thành công");
            // $window.location.href = 'contact.html';
        });

    }
});