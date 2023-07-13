var myApp = angular.module("myApp", []);
myApp.controller("mycontrol", mycontrol);
function mycontrol($scope, $http) {
  $scope.loaddata = function(){
    $http({
      method: 'GET',
      url: current_url + '/api/SanPham/GetAll' 
    }).then(function(res){
      $scope.datas = res.data;
    })
  }
    



  $scope.Xoa = function(id) {
    var result = confirm("Bạn Có Chắc Chắn Xoá Sản Phẩm Không ?");
    if (result) {
      $http({
        method: 'DELETE',
        url: current_url + '/api/SanPham/delete-sanpham?id=' + id
      }).then(function (res) {
        console.log(res);
        alert("Xóa sản phẩm thành công");
        $scope.loaddata();
        
      }).catch(function (err) {
        console.log(err);
        alert("Lỗi xóa bản ghi");
      });
    }
  };

  $scope.loaddata();
}