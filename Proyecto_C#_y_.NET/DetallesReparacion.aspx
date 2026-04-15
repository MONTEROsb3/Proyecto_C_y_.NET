<%@ Page Language="C#" AutoEventWireup="true"
CodeBehind="DetallesReparacion.aspx.cs"
Inherits="Proyecto_C__y_.NET.DetallesReparacion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
  </head>
  <body>
    <form id="form1" runat="server">
      <div>DetalleReparaciones</div>

      <div>
        <asp:GridView
          ID="GridView1"
          runat="server"
          Height="352px"
          Width="483px"
        >
        </asp:GridView>
      </div>
    </form>
  </body>
</html>
