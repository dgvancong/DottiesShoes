var listItem = JSON.parse(localStorage.getItem('cart'));

function LoadData() {
    var str = "";
    var t = 0;
    for (var x of listItem) {
        t += x.donGia * x.soLuong;
        str += `
        <tr >
        <td class="product__cart__item">
            <div class="product__cart__item__pic">
                <img src="https://localhost:7048${x.hinhAnh}" alt="" style="width:130px">
            </div>
            <div class="product__cart__item__text">
                <h6>${x.tenSP}</h6>                
                <h6>${x.donGia.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' })}</h6>
                
                <h6>${x.mauSac}</h6>
                <h6>${x.kichThuoc}</h6>
            </div>
        </td>
        <td class="quantity__item">
            <div class="quantity">
                <div class="pro-qty-2">
                    <input type="text" value="1">
                </div>
            </div>
        </td>
        <td class="cart__price">${(x.donGia * x.soLuong).toLocaleString('vi-VN', { style: 'currency', currency: 'VND' })}</td>
        <td class="cart__close" onclick="xoaCart()><i class="fa fa-close"></i></td>
    </tr>
        `
    }
    document.getElementById('listCart').innerHTML = str
    $("#spTong").text(t + ' VND');
}


function xoaCart() {
    if (confirm("Bạn muốn xóa tất cả sản phẩm khỏi giỏ hàng!")) {
        localStorage.removeItem('cart')
        location.reload();
    }
}
function updateCart() {
    localStorage.setItem('cart', JSON.stringify(listItem));
    alert("Đã cập nhật thông tin giỏ hàng thành công!");
}
function Tang(id) {
    var index = listItem.findIndex(x => x.maSP == id);
    if (index >= 0) {
        listItem[index].soLuong += 1;
    }
    LoadData();
}

function Giam(id) {
    var index = listItem.findIndex(x => x.maSP == id);
    if (index >= 0 && listItem[index].soLuong >= 1) {
        listItem[index].soLuong -= 1;
    }
    LoadData();
}

function updateQuantity(id) {
    var soLuong = Number($('#q_' + id).val());
    var index = listItem.findIndex(x => x.maSP == id);
    if (index >= 0 && listItem[index].soLuong >= 1) {
        listItem[index].soLuong = soLuong;
    }
    LoadData();
}

LoadData();