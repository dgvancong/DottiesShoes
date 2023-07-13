var myApp = angular.module("myApp", []);
myApp.controller("mycontrol", mycontrol);
function mycontrol($scope, $http) {

    // Lấy tham số id từ URL
    var urlParams = new URLSearchParams(window.location.search);
    var id = urlParams.get('id');

    // Gọi hàm productbycategory với tham số id
    productbycategory(id);

    function productbycategory(id) {
        $http({
            url: current_url + '/api/CTDonHang/CTHDN_getall?id=' + id,
            method: "GET"
        }).then(function (res) {
            $scope.productcategory = res.data;
            console.log($scope.productcategory);
        });
    }
    
}