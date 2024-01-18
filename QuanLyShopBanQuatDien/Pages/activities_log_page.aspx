﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/master_page.Master" AutoEventWireup="true"
    CodeBehind="activities_log_page.aspx.cs" Inherits="QuanLyShopBanQuatDien.Pages.activities_log_page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titleContentPlaceHolder" runat="server">
    Nhật ký hoạt động
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
    <link rel="stylesheet" href="../Resources/Libs/jquery-ui/jquery-ui.css">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div id="header" class="bg-light px-4 py-3">
        <div class="h2">
            Nhật ký hoạt động</div>
    </div>
    <div id="body" class="bg-light">
        <div class="d-flex justify-content-between pl-4 py-3">
            <div class="flex-grow-1 row">
                <div class="col-3">
                    <asp:TextBox ID="startDateTextBox" ClientIDMode="Static" class="form-control" placeholder="Chọn ngày bắt đầu..."
                        runat="server"></asp:TextBox>
                    <asp:CustomValidator ID="startDateValidator" runat="server" 
                        onservervalidate="startDateValidator_ServerValidate" ></asp:CustomValidator>
                </div>
                <div class="col-3">
                    <asp:TextBox ID="endDateTextBox" ClientIDMode="Static" class="form-control" placeholder="Chọn ngày kết thúc..."
                        runat="server"></asp:TextBox>
                    <asp:CustomValidator ID="endDateValidator" class="text-danger small" runat="server" 
                        onservervalidate="endDateValidator_ServerValidate" ></asp:CustomValidator>
                </div>
                <div class="col-2">
                    <asp:LinkButton ID="findButton" class="btn btn-primary" runat="server" 
                        onclick="findButton_Click">
                        <i class="fa fa-search mr-1"></i><span>Tìm</span>
                    </asp:LinkButton>
                </div>
            </div>
        </div>
        <div class="px-4">
            <div class="table-responsive">
                <asp:GridView ID="gridView" class="bg-white rounded shadow table table-hover table-bordered text-center"
                    runat="server" AutoGenerateEditButton="False" AutoGenerateColumns="False" ShowHeaderWhenEmpty="true"
                    EmptyDataText="Không có dữ liệu" EmptyDataRowStyle-CssClass="font-italic text-secondary h6"
                    OnRowDataBound="gridView_RowDataBound" OnRowCommand="gridView_RowCommand">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" class="btn btn-primary" runat="server" CommandName="Select"
                                    CommandArgument='<%# Container.DataItemIndex %>'>
                                    <i class="fa fa-edit"></i>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="id" HeaderText="Mã" />
                        <asp:BoundField DataField="username" HeaderText="Tên đăng nhập" />
                        <asp:TemplateField HeaderText="Trạng thái">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("isSuccess").ToString() == "True" ? "Thành công" : "Thất bại" %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="timestamp" HeaderText="Thời gian" DataFormatString="{0:dd/MM/yyyy hh:mm:ss}" />
                        <asp:BoundField DataField="ip" HeaderText="Địa chỉ ip" />
                        <asp:BoundField DataField="deviceInfo" HeaderText="Thông tin thiết bị" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <div class="ml-4 mt-2">
            <div class="small font-italic text-secondary">
                Tổng
                <asp:Label ID="totalOfRecordsLabel" runat="server"></asp:Label>
                bản ghi</div>
        </div>
    </div>
    <div id="footer">
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
    <script type="text/javascript" src="../Resources/Libs/jquery-ui/jquery-ui.js"></script>
    <script type="text/javascript" src="../Resources/Custom/Js/table-datasource-common-config.js"></script>
    <script type="text/javascript">
        $('#startDateTextBox').datepicker({
            dateFormat: 'dd/mm/yy'
        });
        $('#endDateTextBox').datepicker({
            dateFormat: 'dd/mm/yy'
        });
    </script>
</asp:Content>