<%@ Page Title="" Language="C#" MasterPageFile="~/menu.Master" AutoEventWireup="true" CodeBehind="Detalle_Reparacion.aspx.cs" Inherits="Examen2_MiguelSotoAguilar.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridVDetalleR" runat="server">
</asp:GridView>
    <div class="container text-center">
    <h1>DETALLES DE REPARACION</h1>
</div>
<p>
     Estado de la reparacion: <asp:TextBox ID="TxtER" runat="server"></asp:TextBox>
</p>
<div >
    <asp:Button ID="BtnConsultarDetalle" runat="server" class="btn btn-info" Text="Consultar" OnClick="BtnConsultarDetalle_Click"/>
</div>
</asp:Content>
