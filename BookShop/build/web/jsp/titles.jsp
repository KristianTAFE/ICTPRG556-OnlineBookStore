<html>
    <head>
        <title>Untitled Document</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    </head>
    <body bgcolor="#FFFFFF" text="#000000">
        <p>
            <%@ page import="model.*" %>
            <%@ page import="java.util.*"%>
            <%@ page import="java.text.*"%>
        </p>
        <table width="38%" border="0" cellspacing="1" cellpadding="0" height="53" align="left">
            <tr> 
                <td bgcolor="#E2E2E2"> 
                    <div align="left"><font face="Arial, Helvetica, sans-serif"><font face="Times New Roman, Times, serif" size="3"><b><font face="Arial, Helvetica, sans-serif" size="2">Items 
                            in your Shopping Cart</font></b></font></font></div>
                </td>
            </tr>
            <%
                Map items = (Map) session.getAttribute("cart");
                if (items != null) {
                    Set entries = items.entrySet();
                    Iterator iter = entries.iterator();
                    double totalCostOfOrder = 0.00;
                    Book book = null;
                    CartItem item = null;

                    while (iter.hasNext()) {
                        Map.Entry entry = (Map.Entry) iter.next();
                        item = (CartItem) entry.getValue();
                        double cost = item.getOrderCost();
                        totalCostOfOrder += cost;
            %>
            <tr> 
                <td height="13" bgcolor="#E8FFE8"><%= item%></td>
            </tr>
            <%
                } // end while
                DecimalFormat dollars = new DecimalFormat("0.00");
                String totalOrderInDollars = (dollars.format(totalCostOfOrder));
            %>
            <tr> 
                <td height="13" bgcolor="#CCCCCC"> 
                    <div align="right"><font face="Times New Roman, Times, serif"><b><font size="2" face="Arial, Helvetica, sans-serif">Order 
                            Total: <%= totalOrderInDollars%></font></b></font></div>
                </td>
            </tr>
            <%
            }// end if
            else {
            %>
            <tr> 
                <td height="13">No Items in Cart</td>
            </tr>
            <%
                } // end else
            %>
        </table>
        <p>&nbsp;</p><p>&nbsp;</p>
        <p>&nbsp;</p><hr>
        <h2 align="center">WELCOME TO THE ONLINE BOOKSHOP</h2>
        <form name="form1" method="post" action="./books">
            <input type="hidden" name="action" value="add_to_cart">
            <table width="93%" border="2" cellspacing="0" cellpadding="1" bordercolor="#FFFFFF">
                <tr bgcolor="#CCCCCC"> 
                    <td width="10%"><b>ISBN</b></td>
                    <td width="37%"><b>Title</b></td>
                    <td width="24%"><b>Author</b></td>
                    <td width="13%"><b>Price</b></td>
                    <td width="10%"><b>Quantity</b></td>
                    <td width="6%"> 
                        <div align="left"><b>Add</b></div>
                    </td>
                </tr>

                <%
                    List books = (List) session.getAttribute("books");
                    Iterator iter = books.iterator();
                    while (iter.hasNext()) {

                        Book book = (Book) iter.next();
                        String isbn = book.getIsbn();
                        String title = book.getTitle();
                        String author = book.getAuthor();
                        String price = book.getDollarPrice();
                %> 
                <tr bgcolor="#F4F4F4"> 
                    <td width="10%"><%= isbn%></td>
                    <td width="37%"><%= title%></td>
                    <td width="24%"><%= author%></td>
                    <td width="13%"><%= price%></td>
                    <td width="10%"> 
                        <select name=<%= isbn%> size="1">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                        </select>
                    </td>
                    <td width="6%"> 
                        <div align="center"> 
                            <input type="checkbox" name="add" value=<%= isbn%>>
                        </div>
                    </td>
                </tr>
                <% }// end while
%>
                <tr> 
                    <td width="10%"> 
                        <input type="submit" name="Details" value="Add to Cart">
                    </td>
                    <td width="37%">&nbsp;</td>
                    <td width="24%">&nbsp;</td>
                    <td width="13%">&nbsp;</td>
                    <td width="10%">&nbsp;</td>
                    <td width="6%">&nbsp;</td>
                </tr>
            </table>
        </form>
        <p><a href="books?action=view_cart">View Shopping Cart</a></p>
    </body>
</html>
