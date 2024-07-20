<%-- 
    Document   : accountManageAdmin
    Created on : Mar 11, 2024, 9:46:11 AM
    Author     : satori
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>KATH Account Management Admin</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="assets/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End Plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="assets/images/favicon.ico" />
  </head>
  <body>
    <div class=" container-scroller">
      <%@ include file="./detailsforadminpage.jsp" %>
        <div class="main-panel">
          <div class="content-wrapper">
            <div class="page-header">
              <h3 class="page-title"> Account management </h3>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="/server/AdminHomepage">Homepage</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Account management</li>
                </ol>
              </nav>
            </div>
            <div class="row">
              <div class="col-lg-12 grid-margin">
                <div class="card">
                  <div class="card-body">
                    <div class="row icons-list d-flex justify-content-around border-0">
                        
                      <a href="./AccountController?admin=true" class="sepherate col-sm-6 col-md-4 col-lg-3 border text-center text-decoration-none text-warning py-3">
                          <i class="mdi mdi-account-key mx-3"></i> <span><strong>Admin account</strong></span>
                      </a>
                      <a href="./AccountController?customer=true" class="sepherate col-sm-6 col-md-4 col-lg-3 border text-center text-decoration-none text-warning py-3">
                        <i class="mdi mdi-account mx-3"></i> <span><strong>User account</strong></span>
                      </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- plugins:js -->
    <script src="assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="assets/js/off-canvas.js"></script>
    <script src="assets/js/hoverable-collapse.js"></script>
    <script src="assets/js/misc.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <!-- End custom js for this page -->
  </body>
</html>
