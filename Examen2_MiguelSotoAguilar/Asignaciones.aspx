<%@ Page Title="" Language="C#" MasterPageFile="~/menu.Master" AutoEventWireup="true" CodeBehind="Asignaciones.aspx.cs" Inherits="Examen2_MiguelSotoAguilar.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridVDetalle" runat="server">
</asp:GridView>
    <div class="container text-center">
    <h1>Asginaciones</h1>

        </div>
 <div class="container text-center">

    <div class="mb-3">
        <label for="exampleInputEmail1" class="form-label">Codigo</label>
        <asp:TextBox ID="txt_codigo" class="form-control" runat="server"></asp:TextBox>
        
    </div>

    <div class="mb-3">
        <label for="exampleInputEmail1" class="form-label">Reparacion ID</label>
        <asp:TextBox ID="txt_ReparacionID" class="form-control" runat="server"></asp:TextBox>
        
    </div>

    <div class="mb-3">
        <label for="exampleInputEmail1" class="form-label">Tecnico ID</label>
        
        <asp:TextBox ID="txt_TecnicoID" class="form-control" runat="server"></asp:TextBox>
        
    </div>

     <div class="mb-3">
        <label for="exampleInputEmail1" class="form-label">Fecha de asignacion</label>
        
        <asp:TextBox ID="txt_fecha" class="form-control" runat="server"></asp:TextBox>
        
    </div>


</div>
<br>
<br/>
<div >
     <asp:Button ID="Button1" class="btn btn-outline-primary"  runat="server" Text="Asignar" OnClick="Button1_Click" />
 <asp:Button ID="Button2" class="btn btn-outline-primary"  runat="server" Text="Actualizar" OnClick="Button2_Click" />
        
</div>
</asp:Content>