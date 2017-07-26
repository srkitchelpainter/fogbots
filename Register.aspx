<%@ Page Title="Register " Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Account_Register" %>
<%-- When AutoEventWireUp is true event handlers do not need bound to a page event --%>

<%-- 
TITLE: Register.aspx
AUTHOR: Shannon Painter
PURPOSE: Customer Registration Page
ORIGINALLY CREATED ON: 21 Feb 2017
LAST MODIFIED ON: 7 Mar 2017
LAST MODIFIED BY: Shannon Painter
MODIFICATION HISTORY: 28 Feb Added comments. 
                       7 Mar Made edits from Presentation 1 professor feedback.
    --%>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <%-- Anything within the Content tag will get embedded in the ContentPlaceHolder tagg on the master page when generated --%>
    <%-- CSS Classes located in bootstrap.css file --%>
    <br /><br /><br />
<h2><%: Title %></h2>
    <%-- Header updates with Title named in Page directive --%>
    
    
    <p class="text-danger">
        <asp:Label ID="Label1" runat="server"></asp:Label>  <%-- Displays confirmation of registration submission to database.
        <asp:Literal runat="server" ID="ErrorMessage" />   Displays error message related to page--%>
        
    </p>
    
    <div class="form-horizontal">
        <h4>Create a new account.</h4>
        <hr />
      <%-- hr tag defines a thematic break in an HTML page (e.g. a shift of topic) used to separate content--%>

        <asp:ValidationSummary runat="server" CssClass="text-danger" />
             <%--  Displays error messages defined in RequiredFieldValidator--%>

        <%-- First Name --%>
        <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label">First Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="fname" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="fname"
                    CssClass="text-danger" ErrorMessage="First Name is required." />
            </div>
        </div>
                
        <%-- Middle Name --%>
         <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label">Middle Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="mname" CssClass="form-control" />
             </div>
        </div>

        <%-- Last Name --%>
        <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label">Last Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="lname" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="lname"
                    CssClass="text-danger" ErrorMessage="Last Name is required." />
            </div>
        </div>

       <%-- Street Address --%>
        <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label">Street Address</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="address" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="address"
                    CssClass="text-danger" ErrorMessage="The address field is required." />
            </div>
        </div>

        <%-- City --%>
         <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label">City</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="city" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="city"
                    CssClass="text-danger" ErrorMessage="City is required." />
            </div>
        </div>

      <%-- State --%>
         <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label">State</asp:Label>
             <div class="col-md-10">
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" DataSourceID="SqlDataSource3" DataTextField="State" DataValueField="State">
                  </asp:DropDownList>
             <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:shkitcheConnectionString %>" SelectCommand="SELECT * FROM [States]"></asp:SqlDataSource>
           </div>
         </div>

        <%-- Zip Code --%>
         <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label">ZIP Code</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ZIP" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ZIP"
                    CssClass="text-danger" ErrorMessage="ZIP code is required." />
            </div>
        </div>
        
  <%--Email address is used to create user name--%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-2 control-label">Email Address</asp:Label> 
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="UserName" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                    CssClass="text-danger" ErrorMessage="Email address field is required in order to create a customer account." />
             <%-- Email must be in valid format --%>
                <asp:RegularExpressionValidator runat="server" ID="validEmail" ControlToValidate="UserName" validationExpression=".*@.{2,}\..{2,}"
							CssClass="text-danger" ErrorMessage="Email address is not a valid format">
    				</asp:RegularExpressionValidator>

                <p>Email address will be your user name.</p>

            </div>
        </div>

        <%-- Create Password --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Create Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="Password is required." />
                <%--Password must contain: Minimum 8 characters at least 1 Alpha and 1 Number--%>
                <asp:RegularExpressionValidator runat="server" ID="validPassword" ControlToValidate="Password" validationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"
							CssClass="text-danger" ErrorMessage="Password must contain a minimum of 8 characters, at least 1 letter and 1 number.">
    				</asp:RegularExpressionValidator>
         
                       <p>Password must contain a minimum of 8 characters, at least 1 letter and 1 number.</p>
          </div>
        </div>

        <%-- Confirm Password --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" ErrorMessage="Must confirm password." />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" ErrorMessage="Passwords do not match." />
            </div>

		
			 <%-- Submit customer registration data --%>
            <div class="form-group">
             <div class="col-md-offset-2 col-md-10">
            <asp:Button ID="Button1" runat="server" Datasource="SqlDataSource2" Text="Submit" CssClass="btn btn-default" OnClick="CreateUser_Click" />
                              </div>
            </div>
        </div>
        </div>
</asp:Content>
