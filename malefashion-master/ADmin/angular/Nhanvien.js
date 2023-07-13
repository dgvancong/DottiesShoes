var myApp = angular.module("myApp", []);
myApp.controller("mycontrol", mycontrol);
function mycontrol($scope, $http) {
  $scope.loaddata = function(){
    $http({
      method: 'GET',
      url: current_url + '/api/NhanVien/GetAll_nhanvien' 
    }).then(function(res){
      $scope.datas = res.data;
    })
  }

  $scope.Xoa = function(id) {
    var result = confirm("Bạn Có Chắc Chắn Xoá Nhân Viên Không ?");
    if (result) {
      $http({
        method: 'DELETE',
        url: current_url + '/api/NhanVien/delete_nhanvien?id=' + id
      }).then(function (res) {
        console.log(res);
        alert("Xóa nhân viên  thành công");
        $scope.loaddata();
        
      }).catch(function (err) {
        console.log(err);
        alert("Lỗi xóa bản ghi");
      });
    }
  };

  $scope.loaddata();
}