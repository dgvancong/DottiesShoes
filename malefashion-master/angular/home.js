var app = angular.module('ShopDottiesShoes', []);
app.controller("HomeCtrl", function ($scope, $http) {

    $scope.listsanpham;
    $scope.listsanphamindex;
    $scope.listsnhacungcap;
    $scope.listtenloai; 
    $scope.listSanPham;
    $scope.listloaisanphamindex;

    $scope.LoadLoaiSanPham = function(){
        $http({
            method: 'Get',
            url: current_url + '/api/SanPham/GetAll'
        }).then(function(res){
            $scope.listsanpham = res.data;
        })
    }
    $scope.LoadLoaiSanPham();

    $scope.LoadLoaiTenLoai = function(){
        $http({
            method: 'Get',
            url: current_url + '/api/LoaiSanPham/GetAll'
        }).then(function(res){
            $scope.listtenloai = res.data;
        })
    }
    $scope.LoadLoaiTenLoai();

    $scope.LoadNhaCungCap = function(){
        $http({
            method: 'Get',
            url: current_url + '/api/NhaSanXuat/GetAll'
        }).then(function(res){
            $scope.listnhacungcap = res.data;
        })
    }
    $scope.LoadNhaCungCap();

    $scope.LoadSanPhamIndex = function(){
        $http({
            method: 'Get',
            url: current_url + '/api/SanPham/GetSanPhamByViewCount?id=56'
        }).then(function(res){
            $scope.listloaisanphamindex = res.data;
        })
    }
    $scope.LoadSanPhamIndex();

    $scope.LoadLoaiSanPhamIndex = function(){
        $http({
            method: 'Get',
            url: current_url + '/api/Home/GetNewProduct?Soluong=8'
        }).then(function(res){
            $scope.listsanphamindex = res.data;
        })
    }
    $scope.LoadSanPhamIndex();

    $scope.addToCart = function (item) {
        var list = null;
        item.soLuong = 1;       
        var list;
        if (localStorage.getItem('cart') == null) {
            list = [item];
        } else {
            list = JSON.parse(localStorage.getItem('cart')) || [];
            let ok = true;
            for (let x of list) {
                if (x.maSP == item.maSP) {
                    x.soLuong += 1;
                    ok = false;
                    break;
                }
            }
            if (ok) {
                list.push(item);
            }
        }
        localStorage.setItem('cart', JSON.stringify(list));
        alert("Đã thêm giỏ hàng thành công!");
    }

    $scope.LoadTimKiem = function () {		 
        let obj =  {};
        obj.page = "1";
        obj.pageSize = 25;
        obj.tensp = $scope.tensp;
        console.log(obj)
        $http({
            method: 'POST', 
            data: obj, 
            url: current_url + '/api/SanPham/search_sanpham',
        }).then(function (response) {	
            $scope.listSanPham = response.data.data;
			makeScript('js/main.js')
        });
    };  
    $scope.LoadTimKiem();  

});


app.filter("formatCurencyVND", function(){
return function(input){
    return new Intl.NumberFormat('vi-VN', {style: 'currency', currency : 'VND'}).format(input);
}
});