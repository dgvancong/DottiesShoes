var myApp = angular.module("myApp", []);
myApp.controller("mycontrol", mycontrol);
function mycontrol($scope, $http) {
  $scope.loaddata = function(){
    $http({
      method: 'GET',
      url: current_url + '/api/DonHang/getall-donhang' 
    }).then(function(res){
      $scope.datas = res.data;
    })
  }
    



  $scope.Xoa = function(id) {
    var result = confirm("Want to delete?");
    if (result) {
      $http({
        method: 'DELETE',
        url: current_url + '/api/DonHang/delete-donhang?id=' + id
      }).then(function (res) {
        console.log(res);
        alert("Xóa bản ghi thành công");
        $scope.loaddata();
        
      }).catch(function (err) {
        console.log(err);
        alert("Lỗi xóa bản ghi");
      });
    }
  };

  $scope.loaddata();
}