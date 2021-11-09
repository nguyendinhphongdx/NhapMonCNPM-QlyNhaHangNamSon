﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addmaterial.aspx.cs" Inherits="main.ui.manage.addmaterial" ValidateRequest="True" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Quản lý nguyên liệu</title>
    <!--Basic Styles-->
    <link href="../../assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../assets/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../../assets/css/weather-icons.min.css" rel="stylesheet" />

    <!--Fonts-->
    <%--<link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,400,600,700,300" rel="stylesheet" />--%>

    <!--Beyond styles-->
    <link href="../../assets/css/beyond.min.css" rel="stylesheet" />
    <link href="../../assets/css/demo.min.css" rel="stylesheet" />
    <link href="../../assets/css/typicons.min.css" rel="stylesheet" />
    <link href="../../assets/css/animate.min.css" rel="stylesheet" />

    <!--Page Related styles-->
    <link href="../../assets/css/datatable.min.css" rel="stylesheet" />
    <script src="../../assets/js/jquery.min.js"></script>
    <script src="../../assets/js/bootstrap.min.js"></script>

    <!--Skin Script: Place this script in head to load scripts for skins and rtl support-->
    <script src="../../assets/js/skins.min.js"></script>
</head>
<body>
    <!-- Loading Container -->
    <div class="loading-container">
        <div class="loader"></div>
    </div>
    <!--  /Loading Container -->
    <!-- Navbar -->
    <div class="navbar">
        <div class="navbar-inner">
            <div class="navbar-container">
                <!-- Navbar Barnd -->
                <div class="navbar-header pull-left" style="margin-top:4px;">
                    <small>
                        <a href="#" style="font-size: 21px;color: white;">Nhà hàng Nam Sơn</a>
                    </small>
                </div>
                <!-- /Navbar Barnd -->
                <!-- Sidebar Collapse -->
                <div class="sidebar-collapse" id="sidebar-collapse">
                    <i class="collapse-icon fa fa-bars"></i>
                </div>
                <!-- /Sidebar Collapse -->
                <!-- Account Area and Settings --->
                <div class="navbar-header pull-right">
                    <div class="navbar-account" style="font-size: 16px; color: white; padding: 10px;">
                        <a href="../login/dangnhap.aspx" style="color: white;"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</a>
                    </div>
                </div>
                <div class="pull-right">
                    <div class="navbar-account" style="font-size: 16px; color: white; padding: 10px;">
                        <% Response.Write(Session["email"]); %>
                    </div>
                </div>
                <!-- /Account Area and Settings -->
            </div>
        </div>
    </div>
    <!-- /Navbar -->
    <!-- Main Container -->
    <div class="main-container container-fluid">
        <!-- Page Container -->
        <div class="page-container">
            <!-- Page Sidebar -->
            <div class="page-sidebar" id="sidebar">
                <!-- Sidebar Menu -->
                <ul class="nav sidebar-menu">
                    <!--Dashboard-->
                    <li>
                        <a href="index.html">
                            <i class="menu-icon glyphicon glyphicon-home"></i>
                            <span class="menu-text">Tổng quan</span>
                        </a>
                    </li>
                    <!--Tables-->
                    <li>
                        <a href="#" class="menu-dropdown">
                            <i class="menu-icon fa fa-table"></i>
                            <span class="menu-text">Quản lý user</span>

                            <i class="menu-expand"></i>
                        </a>

                        <ul class="submenu">
                            <li>
                                <a href="../user/listuser.aspx">
                                    <span class="menu-text">Danh sách user</span>
                                </a>
                            </li>
                            <li>
                                <a href="../user/changepass.aspx">
                                    <span class="menu-text">Đổi mật khẩu</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <!--Forms-->
                    <li>
                        <a href="#" class="menu-dropdown">
                            <i class="menu-icon fa fa-pencil-square-o"></i>
                            <span class="menu-text">Quản lý nhân sự</span>
                        </a>
                    </li>
                    <!--Charts-->
                    <li>
                        <a href="../Custormers/Customers.aspx" class="menu-dropdown">
                            <i class="menu-icon fa fa-bar-chart-o"></i>
                            <span class="menu-text">Quản lý khách hàng</span>

                            <i class="menu-expand"></i>
                        </a>
                        <ul class="submenu">
                            <li>
                                <a href="../Custormers/Customers.aspx">
                                    <span class="menu-text">Danh sách khách hàng</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    
                    <!--Mail-->
                    <li>
                        <a href="#" class="menu-dropdown">
                            <i class="menu-icon fa fa-envelope-o"></i>
                            <span class="menu-text">Quản lý món ăn</span>

                            <i class="menu-expand"></i>
                        </a>

                        <ul class="submenu">
                            <li>
                                <a href="inbox.html">
                                    <span class="menu-text">Thêm món ăn</span>
                                </a>
                            </li>
                            <li>
                                <a href="message-view.html">
                                    <span class="menu-text">Danh sách món ăn</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                   
                    <!--Pages-->
                    <li>
                        <a href="#" class="menu-dropdown">
                            <i class="menu-icon glyphicon glyphicon-paperclip"></i>
                            <span class="menu-text">Quản lý phiếu order</span>

                            <i class="menu-expand"></i>
                        </a>
                         <ul class="submenu">
                            <li>
                                <a href="../manage/addorder.aspx">
                                    <span class="menu-text">Tạo phiếu order</span>
                                </a>
                            </li>
                            <li class="active">
                                <a href="../manage/listorder.aspx">
                                    <span class="menu-text">Danh sách phiếu</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    
                    <!--Right to Left-->
                    <li class="active open">
                        <a href="material.aspx" class="menu-dropdown">
                            <i class="menu-icon fa fa-align-right"></i>
                            <span class="menu-text">Quản lý nguyên liệu</span>

                            <i class="menu-expand"></i>
                        </a>
                        <ul class="submenu">
                            <li class="active">
                                <a href="addmaterial.aspx">
                                    <span class="menu-text">Thêm nguyên liệu</span>
                                </a>
                            </li>

                            <li>
                                <a href="material.aspx">
                                    <span class="menu-text">Danh sách nguyên liệu</span>
                                </a>
                            </li>

                        </ul>
                    </li>
                </ul>
                <!-- /Sidebar Menu -->
            </div>
            <!-- /Page Sidebar -->
            
            <!-- Page Content -->
            <div class="page-content">
                <!-- Page Breadcrumb -->
                <div class="page-breadcrumbs">
                    <ul class="breadcrumb">
                        <li>
                            <i class="fa fa-home"></i>
                            <a href="#">Trang chủ</a>
                        </li>
                        <li>
                            <a href="#">Quản lý nguyên liệu</a>
                        </li>
                    </ul>
                </div>
                <!-- /Page Breadcrumb -->
                
                <!-- Page Body -->
                <div class="page-body">
                    <div class="row">
                        <div class="col-xs-12 col-md-12">
                            <div class="widget">
                                <div class="widget-header ">
                                    <%
                                        if (Request.QueryString.Count > 0){
                                    %>
                                        <span class="widget-caption">Cập nhật nguyên liệu</span>
                                    <%
                                        } else {
                                    %>
                                        <span class="widget-caption">Thêm nguyên liệu</span>
                                    <%
                                        }
                                    %>
                                </div>
                                <div class="widget-body">
                                    <div class="col-md-offset-2 col-md-10">
                                        <asp:Label ID="lblNoti" runat="server" CssClass=""></asp:Label>
                                    </div>
                                    <form method="POST" class="form-horizontal" runat="server" enctype="multipart/form-data">
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">Tên nguyên liệu</label>
                                            <div class="col-md-10">
                                                <asp:TextBox ID="txtTenMon" CssClass="form-control" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvTenMon" runat="server" 
                                                    ErrorMessage="Vui lòng nhập tên món ăn !" 
                                                    ValidateRequestMode="Enabled" 
                                                    ControlToValidate="txtTenMon" ForeColor="Red" 
                                                    Display="Static" ClientIDMode="Inherit"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">Số lượng</label>
                                            <div class="col-md-10">
                                                <asp:TextBox ID="txtSoLuong" TextMode="Number" CssClass="form-control" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvSoLuong" runat="server" 
                                                    ErrorMessage="Vui lòng nhập số lượng món ăn !" 
                                                    ValidateRequestMode="Enabled" 
                                                    ControlToValidate="txtSoLuong" ForeColor="Red" 
                                                    Display="Static" ClientIDMode="Inherit"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">Đơn giá</label>
                                            <div class="col-md-10">
                                                <asp:TextBox ID="txtDonGia" CssClass="form-control" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvDonGia" runat="server" 
                                                    ErrorMessage="Vui lòng nhập vào đơn giá món ăn !" 
                                                    ValidateRequestMode="Enabled" 
                                                    ControlToValidate="txtDonGia" ForeColor="Red" 
                                                    Display="Static" ClientIDMode="Inherit"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">Đơn vị tính</label>
                                            <div class="col-md-10">
                                                <asp:TextBox ID="txtDVTinh" CssClass="form-control" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvDonViTinh" runat="server" 
                                                    ErrorMessage="Vui lòng nhập vào đơn vị tính !" 
                                                    ValidateRequestMode="Enabled" 
                                                    ControlToValidate="txtDVTinh" ForeColor="Red" 
                                                    Display="Static" ClientIDMode="Inherit"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-offset-2 col-md-10">
                                                <%
                                                    if (Request.QueryString.Count > 0){
                                                %>
                                                        <asp:Button ID="btnFix" runat="server" OnClick="btnFix_Click" Text="Cập nhật nguyên liệu" CssClass="btn btn-primary" />
                                                <%
                                                    } else {
                                                %>
                                                        <asp:Button ID="btnSave" CssClass="btn btn-palegreen" OnClick="btnSave_Click" runat="server" Text="Lưu thông tin" />
                                                <%
                                                    }
                                                %>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Page Body -->
            </div>
            <!-- /Page Content -->
        </div>
        <!-- /Page Container -->
        <!-- Main Container -->

    </div>

    <!--Basic Scripts-->
    <script src="../../assets/js/slimscroll/jquery.slimscroll.min.js"></script>

    <!--Beyond Scripts-->
    <script src="../../assets/js/beyond.min.js"></script>
    
    <!--Page Related Scripts-->
    <script src="../../assets/js/toastr/toastr.js"></script>

    <!--Page Related Scripts-->
    <script src="../../assets/js/datatable/ZeroClipboard.js"></script>
    <script src="../../assets/js/datatable.min.js"></script>
    <script>
        $('.datatable').DataTable({
            pageLength: 25,
            lengthMenu: [[25, 50, 75, -1], [25, 50, 75, "All"]],
            responsive: true,
            dom: '<"html5buttons"B>lTfgitp',
            buttons: [],
            language: {
                lengthMenu: "",
                zeroRecords: "Không có dữ liệu",
                info: "",
                infoEmpty: "",
                infoFiltered: "",
                search:       "Tìm kiếm:",
                paginate: {
                    "sFirst":    "Đầu",
                    "sPrevious": "Trước",
                    "sNext":     "Tiếp",
                    "sLast":     "Cuối"
                }
            }
        });
    </script>
    <script type="text/javascript">
        toastr.options = {
            top: 500,
            closeButton: true,
            progressBar: true,
            showMethod: 'slideDown',
            timeOut: 5000
        };
        <% 
        if (!Session["type"].Equals("")){
            Response.Write("setTimeout(function() {" +
                "toastr." + Session["type"] + "('" + Session["mess"] + "', 'Thông báo');" +
                "}, 100);");
            Session["type"] = "";
            Session["mess"] = "";
        }
        %>
    </script>
</body>
</html>
