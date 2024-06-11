
<%@page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>

<head>

</head>
<body>
<h1 class="text-center">Quản Lý Sản Phẩm</h1>
<div class="container">
    <form action="/san-pham-chi-tiet/update/${data.id}" method="post">
        <div class="mb-3">
            <label class="form-label">Ma SPCT</label>
            <input type="text" class="form-control" name="maSPCT" value="${data.maSPCT}">
            <%--            <c:if test="${not empty errors['ma']}">--%>
            <%--                <small style="color: red">${errors['ma']}</small>--%>
            <%--            </c:if>--%>
        </div>
        <div class="mb-3">
            <label class="form-label">San Pham</label>
            <select class="form-select" name="sanPham">
                <c:forEach items="${dataSP}" var="sanPham">
                    <option value="${sanPham.id}">${sanPham.ten}</option>
                </c:forEach>
            </select>
            <%--            <c:if test="${not empty errors['ten']}">--%>
            <%--                <small style="color: red">${errors['ten']}</small>--%>
            <%--            </c:if>--%>
        </div>
        <div class="mb-3">
            <label class="form-label"> kich thuoc</label>
            <select class="form-select" name="kichThuoc">
                <c:forEach items="${listKichThuoc}" var="kichThuoc">
                    <option value="${kichThuoc.id}">${kichThuoc.ten}</option>
                </c:forEach>
            </select>
            <%--            <c:if test="${not empty errors['ten']}">--%>
            <%--                <small style="color: red">${errors['ten']}</small>--%>
            <%--            </c:if>--%>
        </div>
        <div class="mb-3">
            <label class="form-label"> mau sac</label>
            <select class="form-select" name="mauSac">
                <c:forEach items="${listMauSac}" var="mauSac">
                    <option value="${mauSac.id}">${mauSac.ten}</option>
                </c:forEach>
            </select>
            <%--            <c:if test="${not empty errors['ten']}">--%>
            <%--                <small style="color: red">${errors['ten']}</small>--%>
            <%--            </c:if>--%>
        </div>
        <div class="mb-3">
            <label class="form-label">So luong</label>
            <input class="form-control" type="text" name="soLuong" value="${data.soLuong}">
            <%--            <c:if test="${not empty errors['ten']}">--%>
            <%--                <small style="color: red">${errors['ten']}</small>--%>
            <%--            </c:if>--%>
        </div>
        <div class="mb-3">
            <label class="form-label">Don gia</label>
            <input class="form-control" type="text" name="donGia" value="${data.donGia}">
            <%--            <c:if test="${not empty errors['ten']}">--%>
            <%--                <small style="color: red">${errors['ten']}</small>--%>
            <%--            </c:if>--%>
        </div>
        <div class="mb-3">
            <label>Trang thai</label>
            <select class="form-select" name="trangThai">
                <option value="1" ${data.trangThai == 1 ? "selected":""}>Đang hoạt động</option>
                <option value="0" ${data.trangThai == 0 ? "selected":""}>Ngừng hoạt động</option>
            </select>
        </div>
        <div class="mb-3">
            <button class="btn btn-info">Lưu</button>
        </div>
    </form>
</div>
</body>
</html>
