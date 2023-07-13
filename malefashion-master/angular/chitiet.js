var app = angular.module('ShopDottiesShoes', []);
app.controller("ChitietCtrl", function ($scope, $http) {
    $scope.sanpham;  
    $scope.listhinhanh; 
    $scope.listcungloai;

    $scope.LoadSanPhambyID = function () { 
		var key = 'id';
		var value = window.location.search.substring(window.location.search.indexOf(key)+key.length+1);		 
        $http({
            method: 'POST', 
            url: current_url + '/api/SanPham/get-by-id/'+value,
        }).then(function (response) { 
            $scope.sanpham = response.data;
			makeScript('js/main.js')
        });
    };  
    $scope.LoadSanPhambyID();
    
    $scope.LoadHinhAnh = function(){
        var key = 'id';
		var value = window.location.search.substring(window.location.search.indexOf(key)+key.length+1);		 
        $http({
            method: 'GET',
            url: current_url + '/api/SanPham/sp_IDhinhanh?MaSP=' + value,
        }).then(function (response) { 
            $scope.listhinhanh = response.data;
			makeScript('js/main.js')
        })
    }

    $scope.LoadHinhAnh();

    $scope.LoadTimKiemSP = function () {		 
        let obj =  {};
        obj.page = "1";
        obj.pageSize = 4;
        obj.maLoai = $scope.maLoai;
        console.log(obj)
        $http({
            method: 'POST', 
            data: obj, 
            url: current_url + '/api/SanPham/search_sanpham',
        }).then(function (response) {	
            $scope.listcungloai = response.data.data;
			makeScript('js/main.js')
        });
    };  
    $scope.LoadTimKiemSP(); 
});
app.filter("formatCurencyVND", function(){
    return function(input){
        return new Intl.NumberFormat('vi-VN', {style: 'currency', currency : 'VND'}).format(input);
    }
});