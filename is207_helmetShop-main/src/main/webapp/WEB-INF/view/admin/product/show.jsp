<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>

                <meta charset="utf-8">
                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
                <meta name="description" content="">
                <meta name="author" content="">

                <title>Helmet-Shop</title>

                <!-- Custom fonts for this template-->
                <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
                <link
                    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
                    rel="stylesheet">

                <!-- Custom styles for this template-->
                <link href="/css/sb-admin-2.min.css" rel="stylesheet">
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
                <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

            </head>

            <body id="page-top">

                <!-- Page Wrapper -->
                <div id="wrapper">

                    <!-- Sidebar -->
                    <jsp:include page="../layout/sidebar.jsp" />
                    <!-- End of Sidebar -->

                    <!-- Content Wrapper -->
                    <div id="content-wrapper" class="d-flex flex-column">

                        <!-- Main Content -->
                        <div id="content">

                            <jsp:include page="../layout/header.jsp" />

                            <!-- Begin Page Content -->
                            <div class="container-fluid">

                                <!-- DataTales Example -->
                                <div class="card shadow mb-4">
                                    <div class="card-header py-3">
                                        <h6 class="m-0 font-weight-bold text-primary">Danh sách sản phẩm</h6>
                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                                                <div class="row d-flex justify-content-end  ">
                                                    <div class="col-sm-12 col-md-6 py-2 d-flex justify-content-end">
                                                        <a href="/admin/product/create"
                                                            class="btn btn-primary btn-icon-split btn-sm">
                                                            <span class="icon text-white-50">
                                                                <i class="fas fa-plus-circle"></i>
                                                            </span>
                                                            <span class="text">Thêm mới</span>
                                                        </a>
                                                    </div>

                                                </div>
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <table class="table table-bordered dataTable" id="dataTable"
                                                            width="100%" cellspacing="0" role="grid"
                                                            aria-describedby="dataTable_info" style="width: 100%;">
                                                            <thead>
                                                                <tr role="row">
                                                                    <th class="sorting sorting_asc" tabindex="0"
                                                                        aria-controls="dataTable" rowspan="1"
                                                                        colspan="1"
                                                                        aria-label="Name: activate to sort column descending"
                                                                        aria-sort="ascending" style="width: 33.333px;">
                                                                        ID</th>
                                                                    <th class="sorting sorting_asc" tabindex="0"
                                                                        aria-controls="dataTable" rowspan="1"
                                                                        colspan="1"
                                                                        aria-label="Name: activate to sort column descending"
                                                                        aria-sort="ascending" style="width: 33.333px;">
                                                                        Code</th>
                                                                    <th class="sorting sorting_asc" tabindex="0"
                                                                        aria-controls="dataTable" rowspan="1"
                                                                        colspan="1"
                                                                        aria-label="Name: activate to sort column descending"
                                                                        aria-sort="ascending" style="width: 102.333px;">
                                                                        Thumbnail</th>
                                                                    <th class="sorting" tabindex="0"
                                                                        aria-controls="dataTable" rowspan="1"
                                                                        colspan="1"
                                                                        aria-label="Position: activate to sort column ascending"
                                                                        style="width:  102.333px;">Category</th>
                                                                    <th class="sorting" tabindex="0"
                                                                        aria-controls="dataTable" rowspan="1"
                                                                        colspan="1"
                                                                        aria-label="Office: activate to sort column ascending"
                                                                        style="width:  102.333px;">Status</th>
                                                                    <th class="sorting" tabindex="0"
                                                                        aria-controls="dataTable" rowspan="1"
                                                                        colspan="1"
                                                                        aria-label="Position: activate to sort column ascending"
                                                                        style="width: 77.333px;">Action</th>
                                                                </tr>
                                                            </thead>
                                                            <tfoot>
                                                                <tr>
                                                                    <th rowspan="1" colspan="1">ID</th>
                                                                    <th rowspan="1" colspan="1">Code</th>
                                                                    <th rowspan="1" colspan="1">Thumbnail</th>
                                                                    <th rowspan="1" colspan="1">Category</th>
                                                                    <th rowspan="1" colspan="1">Status</th>
                                                                    <th rowspan="1" colspan="1">Action</th>
                                                                </tr>
                                                            </tfoot>
                                                            <tbody>
                                                                <c:forEach var="product" items="${productShow}">
                                                                    <tr class="odd">
                                                                        <td class="">${product.id}</td>
                                                                        <td class="">${product.code}</td>
                                                                        <td class="">
                                                                            <img id="imagePreview" class="p-1"
                                                                                src="/img/product/${product.avatar}"
                                                                                style="max-width: 100px;border-radius: 10px;" />
                                                                        </td>
                                                                        <td class="">${product.categoryDTO.name}</td>
                                                                        <td class="">
                                                                            <c:set var="sum" value="0" />
                                                                            <c:forEach var="price"
                                                                                items="${product.product_sizeDTOs}">

                                                                                <c:set var="sum"
                                                                                    value="${sum + price.quantity}" />

                                                                            </c:forEach>
                                                                            <c:if test="${sum > 0}">

                                                                                <c:out value="Available" />

                                                                            </c:if>
                                                                            <c:if test="${sum == 0}">

                                                                                <c:out value="No-Available" />

                                                                            </c:if>
                                                                        </td>
                                                                        <td>

                                                                            <a
                                                                                href="/admin/product/update/${product.id}">
                                                                                <i class="fas fa-edit"></i>
                                                                            </a>
                                                                            <form id="deleteForm${product.id}"
                                                                                action="/admin/product/delete/${product.id}"
                                                                                method="post" style="display: inline;">
                                                                                <input type="hidden"
                                                                                    name="${_csrf.parameterName}"
                                                                                    value="${_csrf.token}" />
                                                                                <button type="submit"
                                                                                    style="border: none; background-color:#f8f9fc;"
                                                                                    onclick="confirmDelete(event,'deleteForm${product.id}')">
                                                                                    <a href="">
                                                                                        <i class="far fa-trash-alt"></i>
                                                                                    </a>
                                                                                </button>
                                                                            </form>
                                                                        </td>

                                                                    </tr>
                                                                </c:forEach>

                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>



                                                <div class="dataTables_paginate paging_simple_numbers"
                                                    id="dataTable_paginate">
                                                    <ul class="pagination justify-content-center">

                                                        <li class="${1 eq currentPage ? 'paginate_button page-item previous disabled' : 'paginate_button page-item previous'}"
                                                            id="dataTable_previous"><a
                                                                href="/admin/product?page=${currentPage - 1}"
                                                                aria-controls="dataTable" data-dt-idx="0" tabindex="0"
                                                                class="page-link">Previous</a></li>

                                                        <c:forEach begin="0" end="${totalPages - 1}" varStatus="loop">
                                                            <li
                                                                class="${(loop.index + 1) eq currentPage ? 'paginate_button page-item active' : 'paginate_button page-item'}">
                                                                <a href="/admin/product?page=${loop.index + 1}"
                                                                    aria-controls="dataTable" data-dt-idx="1"
                                                                    tabindex="0" class="page-link">${loop.index
                                                                    + 1}</a>
                                                            </li>
                                                        </c:forEach>

                                                        <li class="${totalPages eq currentPage ? 'paginate_button page-item previous disabled' : 'paginate_button page-item previous'}"
                                                            id="dataTable_next"><a
                                                                href="/admin/product?page=${currentPage+ 1}"
                                                                aria-controls="dataTable" data-dt-idx="2" tabindex="0"
                                                                class="page-link">Next</a></li>
                                                    </ul>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <!-- /.container-fluid -->

                        </div>
                        <!-- End of Main Content -->

                        <!-- Footer -->
                        <jsp:include page="../layout/footer.jsp" />
                        <!-- End of Footer -->

                    </div>
                    <!-- End of Content Wrapper -->

                </div>
                <!-- End of Page Wrapper -->

                <!-- Scroll to Top Button-->
                <a class="scroll-to-top rounded" href="#page-top">
                    <i class="fas fa-angle-up"></i>
                </a>

                <!-- Logout Modal-->
                <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                            <div class="modal-body">Select "Logout" below if you are ready to end your current session.
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                                <a class="btn btn-primary" href="login.html">Logout</a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Bootstrap core JavaScript-->
                <script src="/vendor/jquery/jquery.min.js"></script>
                <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

                <!-- Core plugin JavaScript-->
                <script src="/vendor/jquery-easing/jquery.easing.min.js"></script>

                <!-- Custom scripts for all pages-->
                <script src="/js/sb-admin-2.min.js"></script>

                <!-- Page level plugins -->
                <script src="/vendor/chart.js/Chart.min.js"></script>

                <!-- Page level custom scripts -->
                <script src="/js/demo/chart-area-demo.js"></script>
                <script src="/js/demo/chart-pie-demo.js"></script>
                <script src="/js/custom.js"></script>

            </body>

            </html>