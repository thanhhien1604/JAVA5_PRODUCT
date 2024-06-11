<%@page language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
<html>
<head></head>
<body>

<div class="container-fluide">
    <div class="">
        <jsp:include page="../../views/navbar.jsp"></jsp:include>
    </div>
    <div class="row">
        <div class="col-sm-2 mt-5">
            <jsp:include page="../../views/navbarcoll.jsp"></jsp:include>
        </div>

        <div class="col-sm-10">
            <div>
                Quuyen :${sessionScope.quyen}
            </div>
            <div>
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8">
                            <div class="mt-5">
                                <a href="/ban-hang/taoHoaDon">
                                    <button class="btn btn-outline-info">Tạo hóa đơn</button>
                                </a>
                            </div>

                            <h6 class="mt-2">Hóa đơn</h6>
                            <div class="table">
                                <table class="table table-striped table-hover">
                                    <thead>
                                        <th>ID</th>
                                        <th>Ngày mua hàng</th>
                                        <th>Tên nhân viên</th>
                                        <th>Tong tien</th>
                                        <th>Trạng thái</th>
                                        <th>Thao tác</th>
                                    <thead>
                                    <tbody>
                                    <c:forEach varStatus="i" var="item" items="${listHD}">
                                        <tr>
                                            <td>${item.id}</td>
                                            <td>${item.ngayMuaHang}</td>
                                            <td>${item.nhanVien.ten}</td>
                                            <td>${item.tongTien}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${item.trangThai eq 1}">
                                                        DA THANH TOAN
                                                    </c:when>
                                                    <c:when test="${item.trangThai eq 0}">
                                                       DANG CHO
                                                    </c:when>
                                                    <c:otherwise>
                                                        DA HUY
                                                    </c:otherwise>

                                                </c:choose>
                                            </td>
                                            <td>
                                                <a><button class="btn btn-success">Chon</button></a>
                                                <a href="/ban-hang/delete/${item.id}"><button class="btn btn-danger">Huy</button></a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>

                            <h6>Giỏ hàng</h6>
                            <div class="table">
                                <table class="table table-striped table-hover">
                                    <thead>
                                        <th>ID</th>
                                        <th>Mã SP</th>
                                        <th>Tên Sản Phẩm</th>
                                        <th>Màu Sắc</th>
                                        <th>Kích thước</th>
                                        <th>Số luượng</th>
                                        <th>Đơn giá</th>
                                        <th>Thành tiền</th>
                                    </thead>
                                    <tbody>
                                    <c:forEach varStatus="i" var="gh" items="${dataGioHang}">
                                        <tr>
                                            <td>${gh.id}</td>
                                            <td>${gh.ma}</td>
                                            <td>${gh.ten}</td>
                                            <td>${gh.ten}</td>
                                            <td>${gh.ten}</td>
                                            <td>${gh.soLuong}</td>
                                            <td>${gh.donGia}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>

                            <h6>Sản phẩm chi tiết</h6>
                            <div class="table">
                                <table class="table table-striped table-hover">
                                    <thead>
                                    <th>ID</th>
                                    <th>Mã San Pham Chi Tiết</th>
                                    <th>Màu Sắc</th>
                                    <th>Kích thước</th>
                                    <th>Tên Sản Phẩm</th>
                                    <th>Số lượng</th>
                                    <th>Đơn giá</th>
                                    </thead>
                                    <tbody>
                                    <c:forEach varStatus="i" var="item" items="${data.content}">
                                        <tr>
                                            <td>${item.id}</td>
                                            <td>${item.maSPCT}</td>
                                            <td>${item.mauSac.ten}</td>
                                            <td>${item.kichThuoc.ten}</td>
                                            <td>${item.sanPham.ten}</td>
                                            <td>${item.soLuong}</td>
                                            <td>${item.donGia}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination justify-content-center">
                                        <c:if test="${totalPages > 0}">
                                            <c:if test="${currentPage > 0}">
                                                <li class="page-item">
                                                    <a class="page-link" href="?page=${currentPage }"><<</a>
                                                </li>
                                            </c:if>
                                            <c:if test="${currentPage <= 0}">
                                                <li class="page-item disabled">
                                                    <span class="page-link"><<</span>
                                                </li>
                                            </c:if>

                                            <!-- Logic for displaying page numbers with "..." -->
                                            <c:choose>
                                                <c:when test="${totalPages <= 5}">
                                                    <c:forEach var="i" begin="0" end="${totalPages - 1}">
                                                        <li class="page-item ${currentPage == i ? 'active' : ''}">
                                                            <a class="page-link" href="?page=${i}">${i + 1}</a>
                                                        </li>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <li class="page-item ${currentPage == 0 ? 'active' : ''}">
                                                        <a class="page-link" href="?page=0">1</a>
                                                    </li>
                                                    <c:if test="${currentPage > 2}">
                                                        <li class="page-item disabled">
                                                            <span class="page-link">...</span>
                                                        </li>
                                                    </c:if>
                                                    <c:forEach var="i" begin="${currentPage }" end="${currentPage + 1}">
                                                        <c:if test="${i > 0 && i < totalPages - 1}">
                                                            <li class="page-item ${currentPage == i ? 'active' : ''}">
                                                                <a class="page-link" href="?page=${i}">${i + 1}</a>
                                                            </li>
                                                        </c:if>
                                                    </c:forEach>
                                                    <c:if test="${currentPage < totalPages - 3}">
                                                        <li class="page-item disabled">
                                                            <span class="page-link">...</span>
                                                        </li>
                                                    </c:if>
                                                    <li class="page-item ${currentPage == totalPages - 1 ? 'active' : ''}">
                                                        <a class="page-link" href="?page=${totalPages - 1}">${totalPages}</a>
                                                    </li>
                                                </c:otherwise>
                                            </c:choose>

                                            <c:if test="${currentPage < totalPages - 1}">
                                                <li class="page-item">
                                                    <a class="page-link" href="?page=${currentPage + 1}">>></a>
                                                </li>
                                            </c:if>
                                            <c:if test="${currentPage >= totalPages - 1}">
                                                <li class="page-item disabled">
                                                    <span class="page-link">>></span>
                                                </li>
                                            </c:if>
                                        </c:if>
                                    </ul>
                                </nav>
                            </div>

                        </div>
                        <div class="col-sm-4 custom-border mt-5">
                            <form>
                                <label class="form-label">Mã hóa đơn: </label>
                                <br>
                                <label class="form-label">Ngày tạo: </label>
                                <br>
                                <label class="form-label">Tên nhân viên: </label>
                                <br>
                                <label class="form-label">Tổng tiền: </label>
                                <br>
                                <label class="form-label">Thành tiền: </label>
                                <input type="text" class="form-control">
                                <br>
                                <label class="form-label">Tiền dư: </label>
                                <br>
                                <button type="submit" class="btn btn-primary">Thanh toán</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div>
        <jsp:include page="../../views/footer.jsp"></jsp:include>
    </div>
</div>
</body>