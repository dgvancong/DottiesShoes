var app = angular.module('AppBanHang', []);
app.controller("CheckoutCtrl", function ($scope, $http, $window) {
    let cart = [];
    let listjson_detail =[];
    let ThongTinCT = {};
    let SanPham = {};

    $scope.ThemSP = function(){

        DonHang.trangThaiDonHang = $scope.trangthaikh;
        DonHang.hoTen = $scope.tenkh;
        DonHang.soDT = $scope.sdtkh;
        DonHang.diaChi = $scope.diachikh;
        DonHang.ghiChu = 'Chờ xác nhận';
        
        $scope.myData = $window.localStorage.getItem('cart');
        cart = JSON.parse($scope.myData);

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